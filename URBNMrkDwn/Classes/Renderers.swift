//
//  Renderers.swift
//  Pods
//
//  Created by Jason Grandelli on 10/24/16.
//
//

import Foundation
import cmark

public struct MrkDwnRenderers {
    /**
     Converts a Markdown string to an AST.
     
     - parameter markdown: String containing Markdown
     
     - parameter options: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to AST.
     
     - throws: `MrkDwnRenderErrors.toASTError`
     
     - returns: An OpaquePointer for the AST
     */
    public static func renderASTFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> OpaquePointer {
        var node: OpaquePointer?
        
        markdown.withCString {
            let l = Int(strlen($0))
            node = cmark_parse_document($0, l, options.rawValue) as? OpaquePointer
        }
        
        guard let ast = node else { throw MrkDwnRenderErrors.toASTError }
        
        return ast
    }
    
    /**
     Converts an AST to HTML.
     
     - parameter ast: OpaquePoint to an AST
     
     - parameter options: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to AST & HTML.
     
     - throws: `MrkDwnRenderErrors`
     
     - returns: An HTML String
     */
    public static func renderHTMLFromAST(_ ast: OpaquePointer, options: MrkDwnOptions = .default) throws -> String {
        guard let cString = cmark_render_html(ast, options.rawValue) else { throw MrkDwnRenderErrors.astRenderingError }
        defer { free(cString) }
        guard let string = String(cString: cString, encoding: String.Encoding.utf8) else { throw MrkDwnRenderErrors.astRenderingError }
        
        return string
    }
    
    /**
     Converts a Markdown string to an AST. Calls through to `renderASTFromMarkdown(_:, options:)` & `renderHTMLFromAST(_:, options:)`
     
     - parameter markdown: String containing Markdown
     
     - parameter options: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to HTML.
     
     - throws: `MrkDwnRenderErrors`
     
     - returns: An HTML String
     */
    public static func renderHTMLFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> String {
        let ast = try MrkDwnRenderers.renderASTFromMarkdown(markdown, options: options)
        defer { cmark_node_free(ast) }
        let html = try MrkDwnRenderers.renderHTMLFromAST(ast, options: options)
        
        return html
    }
}
