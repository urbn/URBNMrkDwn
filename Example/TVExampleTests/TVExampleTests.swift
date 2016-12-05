//
//  TVExampleTests.swift
//  TVExampleTests
//
//  Created by Evan Dutcher on 12/5/16.
//  Copyright © 2016 URBN. All rights reserved.
//

import XCTest
import URBNMrkDwn

class TVExampleTests: XCTestCase {
    
    func testMarkDownToHTML() {
        for md in markdownSamples {
            let renderedHTMLString = try? MrkDwnRenderers.renderHTMLFromMarkdown(md.markdownString)
            XCTAssertEqual(renderedHTMLString, md.htmlString, "rendered HTML did not match expected. Rendered = \(renderedHTMLString)")
        }
    }
}
