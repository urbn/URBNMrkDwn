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
    public static func renderASTFromMarkdown(_ markdown: String, options: MrkDwnOptions = .default) throws -> UnsafeMutablePointer<cmark_node> {
        var node: UnsafeMutablePointer<cmark_node>?
        
        markdown.withCString {
            let l = Int(strlen($0))
            node = cmark_parse_document($0, l, options.rawValue)
        }
        
        guard let ast = node else {
            throw RenderErrors.toASTError
        }
        
        return ast
    }
}
