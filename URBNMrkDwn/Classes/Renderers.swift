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
    public static func renderASTFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> OpaquePointer {
        var node: OpaquePointer?
        
        markdown.withCString {
            let l = Int(strlen($0))
            node = cmark_parse_document($0, l, options.rawValue) as? OpaquePointer
        }
        
        guard let ast = node else { throw MrkDwnRenderErrors.toASTError }
        
        return ast
    }
    
    public static func renderHTMLFromAST(_ ast: OpaquePointer, options: MrkDwnOptions = .default) throws -> String {
        guard let cString = cmark_render_html(ast, options.rawValue) else { throw MrkDwnRenderErrors.toASTError }
        defer { free(cString) }
        guard let string = String(cString: cString, encoding: String.Encoding.utf8) else { throw MrkDwnRenderErrors.toASTError }
        
        return string
    }
    
    public static func renderHTMLFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> String {
        let ast = try MrkDwnRenderers.renderASTFromMarkdown(markdown, options: options)
        defer { cmark_node_free(ast) }
        let html = try MrkDwnRenderers.renderHTMLFromAST(ast, options: options)
        
        return html
    }
}
