//
//  NSAttributedString+MrkDwn.swift
//  Pods
//
//  Created by Jason Grandelli on 10/25/16.
//
//

import Foundation
import UIKit

public extension NSAttributedString {
    public convenience init(htmlString: String) throws {
        guard let htmlData = htmlString.data(using: .utf8) else { throw MrkDwnRenderErrors.htmlDataConversionError }
        
        let opt: [String: Any] = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: NSNumber(value: String.Encoding.utf8.rawValue)]
        
        try self.init(data: htmlData, options: opt, documentAttributes: nil)
    }
    
    public convenience init(markdownString: String, options: MrkDwnOptions = .default) throws {
        let htmlString = try MrkDwnRenderers.renderHTMLFromMarkdown(markdownString, options: options)

        try self.init(htmlString: htmlString)
    }
}
