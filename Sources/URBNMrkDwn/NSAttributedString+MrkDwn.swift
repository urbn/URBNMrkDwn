//
//  NSAttributedString+MrkDwn.swift
//  Pods
//
//  Created by Jason Grandelli on 10/25/16.
//
//

import UIKit

public extension NSAttributedString {
    /**
     Initializes an NSAttributedString with an htmlString
     
     - parameter htmlString: A string with HTML
     
     - throws: `MrkDwnRenderErrors.htmlDataConversionError` or initialization error
     
     - returns: An attributed string
     */
    convenience init(htmlString: String) throws {
        guard let htmlData = htmlString.data(using: .utf8) else { throw MrkDwnRenderErrors.htmlDataConversionError }
        
        let opt: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue]
        
        try self.init(data: htmlData, options: opt, documentAttributes: nil)
    }
    
    /**
     Initializes an NSAttributedString with a markdown string. Calls through to init(htmlString:) after converting the markdown string to html via MrkDwnRenderers.renderHTMLFromMarkdown(_:, options:).
     
     - parameter markdownString: A string with HTML
     
     - parameter options: `MrkDwnOptions` defaults to `MrkDwnOptions.default`. Options for rendering markdown to html.
     
     - throws: `MrkDwnRenderErrors` or initialization error
     
     - returns: An attributed string
     */
    convenience init(markdownString: String, options: MrkDwnOptions = .default) throws {
        let htmlString = try MrkDwnRenderers.renderHTMLFromMarkdown(markdownString, options: options)

        try self.init(htmlString: htmlString)
    }
}
