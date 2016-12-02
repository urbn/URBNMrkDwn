//
//  AttributedStringTests.swift
//  Example
//
//  Created by Jason Grandelli on 10/25/16.
//  Copyright © 2016 URBN. All rights reserved.
//

import XCTest

class AttributedStringTests: XCTestCase {
    func testHTMLStringToAttributedString() {
        for md in markdownSamples {
            let attributedString = try? NSAttributedString(htmlString: md.htmlString)
            XCTAssertEqual(attributedString?.string, md.attributedString, "attributed string did not match expected. Attributed String = \(attributedString?.string)")
        }
    }
    
    func testMarkdownStringToAttributedString() {
        for md in markdownSamples {
            let attributedString = try? NSAttributedString(markdownString: md.markdownString)
            XCTAssertEqual(attributedString?.string, md.attributedString, "attributed string did not match expected. Attributed String = \(attributedString?.string)")
        }
    }
}
