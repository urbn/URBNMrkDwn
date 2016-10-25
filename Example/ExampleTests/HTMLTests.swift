//
//  HTMLTests.swift
//  Example
//
//  Created by Jason Grandelli on 10/25/16.
//  Copyright © 2016 URBN. All rights reserved.
//

import XCTest
import URBNMrkDwn

class HTMLTests: XCTestCase {
    func testMarkDownToHTML() {
        for md in markdownSamples {
            let renderedHTMLString = try? MrkDwnRenderers.renderHTMLFromMarkdown(md.markdownString)
            XCTAssertEqual(renderedHTMLString, md.htmlString, "rendered HTML did not match expected. Rendered = \(renderedHTMLString)")
        }
    }
}
