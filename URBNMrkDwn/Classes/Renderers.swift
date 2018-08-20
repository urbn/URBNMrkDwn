//
//  Renderers.swift
//  Pods
//
//  Created by Jason Grandelli on 10/24/16.
//
//

import Foundation
import libcmark_gfm

public struct MrkDwnRenderers {
    /**
     Converts a Markdown string to an AST.
     
     - parameter markdown: String containing Markdown
     
     - parameter options: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to AST.
     
     - throws: `MrkDwnRenderErrors.toASTError`
     
     - returns: An OpaquePointer for the AST
     */
    public static func renderASTFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> UnsafeMutablePointer<cmark_node> {
        guard let node = cmark_parse_document(markdown, markdown.utf8.count, options.rawValue) else { throw MrkDwnRenderErrors.toASTError }
        
        return node
    }
    
    /**
     Converts an AST to HTML.
     
     - parameter ast: OpaquePoint to an AST
     
     - parameter options: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to AST & HTML.
     
     - throws: `MrkDwnRenderErrors`
     
     - returns: An HTML String
     */
    public static func renderHTMLFromAST(_ ast: UnsafeMutablePointer<cmark_node>, options: MrkDwnOptions = .default) throws -> String {
        var extensions: UnsafeMutablePointer<cmark_llist>? = nil
        
//        if let tagfilter = cmark_find_syntax_extension("tagfilter") { // This feels like danger
            //extensions = cmark_llist_append(cmark_get_default_mem_allocator(), nil, tagfilter)
//        }
        
        guard let cString = cmark_render_html(ast, options.rawValue, extensions) else { throw MrkDwnRenderErrors.astRenderingError }
        defer { free(cString) }
        
        return String(cString: cString)
    }
    
    /**
     Converts a Markdown string to an AST.
     
     - parameter markdown: String containing Markdown
     
     - parameter options: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to HTML.
     
     - throws: `MrkDwnRenderErrors.markdownToHTMLError`
     
     - returns: An HTML String
     */
    public static func renderHTMLFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> String {
        guard let html = cmark_markdown_to_html(markdown, markdown.utf8.count, options.rawValue) else { throw MrkDwnRenderErrors.markdownToHTMLError }
        
        return String(cString: html)
    }
}
