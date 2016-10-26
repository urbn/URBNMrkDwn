//
//  RenderHelpers.swift
//  Pods
//
//  Created by Jason Grandelli on 10/24/16.
//
//

import Foundation
import cmark

/// MrkDwn Rendering Errors
public enum MrkDwnRenderErrors: Error {
    /// Error converting Markdown to AST (Abstract Syntax Tree)
    case toASTError

    /// Error rendering AST to another format (e.g. HTML)
    case astRenderingError

    /// Error rendering Markdown to HTML string
    case markdownToHTMLError
    
    /// Error converting HTML String to NSData
    case htmlDataConversionError
}

/// Swifty wrapper around CMark Options used in rendering
public struct MrkDwnOptions: OptionSet {
    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    
    /**
     Maps to `CMARK_OPT_DEFAULT`

     Default options.
     */
    public static let `default` = MrkDwnOptions(rawValue: CMARK_OPT_DEFAULT)
    
    /**
     Maps to `CMARK_OPT_SOURCEPOS`

     Include a `data-sourcepos` attribute on all block elements.
     */
    public static let sourcePos = MrkDwnOptions(rawValue: CMARK_OPT_SOURCEPOS)

    /**
     Maps to `CMARK_OPT_HARDBREAKS`
     
     Render `softbreak` elements as hard line breaks.
     */
    public static let hardBreaks = MrkDwnOptions(rawValue: CMARK_OPT_HARDBREAKS)
    
    /**
     Maps to `CMARK_OPT_SAFE`
     
     Suppress raw HTML and unsafe links (`javascript:`, `vbscript:`, `file:`, and `data:`, except for `image/png`, `image/gif`, `image/jpeg`, or `image/webp` mime types). Raw HTML is replaced by a placeholder HTML comment. Unsafe links are replaced by empty strings.
     */
    public static let safe = MrkDwnOptions(rawValue: CMARK_OPT_SAFE)
    
    /**
     Maps to `CMARK_OPT_NORMALIZE`
     
     Normalize tree by consolidating adjacent text nodes.
     */
    public static let normalize = MrkDwnOptions(rawValue: CMARK_OPT_NORMALIZE)
    
    /**
     Maps to `CMARK_OPT_VALIDATE_UTF8`
     
     Validate UTF-8 in the input before parsing, replacing illegal sequences with the replacement character U+FFFD.
     */
    public static let validateUTF8 = MrkDwnOptions(rawValue: CMARK_OPT_VALIDATE_UTF8)
    
    /**
     Maps to `CMARK_OPT_SMART`
     
     Convert straight quotes to curly, --- to em dashes, -- to en dashes.
     */
    public static let smart = MrkDwnOptions(rawValue: CMARK_OPT_SMART)
}
