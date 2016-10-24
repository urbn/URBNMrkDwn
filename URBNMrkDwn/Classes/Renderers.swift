//
//  Renderers.swift
//  Pods
//
//  Created by Jason Grandelli on 10/24/16.
//
//

import Foundation
import cmark

public struct Renderers {
    public static func renderASTFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> OpaquePointer {
        var node: OpaquePointer?
        
        markdown.withCString {
            let l = Int(strlen($0))
            node = cmark_parse_document($0, l, options.rawValue) as? OpaquePointer
        }
        
        guard let ast = node else { throw RenderErrors.toASTError }
        
        return ast
    }
    
    public static func renderHTMLFromAST(_ ast: OpaquePointer, options: MrkDwnOptions = .default) throws -> String {
        guard let cString = cmark_render_html(ast, options.rawValue) else { throw RenderErrors.toASTError }
        defer { free(cString) }
        guard let string = String(cString: cString, encoding: String.Encoding.utf8) else { throw RenderErrors.toASTError }
        
        return string
    }
    
    public static func renderHTMLFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> String {
        let ast = try Renderers.renderASTFromMarkdown(markdown, options: options)
        defer { cmark_node_free(ast) }
        let html = try Renderers.renderHTMLFromAST(ast, options: options)
        
        return html
    }
}
