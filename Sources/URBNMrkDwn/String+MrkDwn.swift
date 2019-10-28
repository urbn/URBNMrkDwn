//
//  String+MrkDwn.swift
//  Pods
//
//  Created by Jason Grandelli on 10/25/16.
//
//

import Foundation

// MARK: String Convenience
public extension String {
    /**
     Converts a Markdown string to an AST.
     
     - parameter withOptions: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to AST.
     
     - throws: `MrkDwnRenderErrors`
     
     - returns: An OpaquePointer for the AST
     */
    func toAST(withOptions options: MrkDwnOptions = .default) throws -> OpaquePointer {
        return try MrkDwnRenderers.renderASTFromMarkdown(self, options: options)
    }
    
    /**
     Converts a Markdown string to an HTML string.
     
     - parameter withOptions: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to HTML.
     
     - throws: `MrkDwnRenderErrors`
     
     - returns: An HTML String
     */
    func toHTML(withOptions options: MrkDwnOptions = .default) throws -> String {
        return try MrkDwnRenderers.renderHTMLFromMarkdown(self, options: options)
    }
}
