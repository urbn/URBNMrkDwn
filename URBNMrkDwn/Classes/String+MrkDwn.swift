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
    public func toAST(withOptions options: MrkDwnOptions = .default) throws -> OpaquePointer {
        return try MrkDwnRenderers.renderASTFromMarkdown(self, options: options)
    }
    
    public func toHTML(withOptions options: MrkDwnOptions = .default) throws -> String {
        return try MrkDwnRenderers.renderHTMLFromMarkdown(self, options: options)
    }
}
