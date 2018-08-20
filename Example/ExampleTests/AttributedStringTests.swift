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
            guard let attributedString = try? NSAttributedString(htmlString: md.htmlString) else {
                XCTFail("Should be working")
                return
            }
            
            XCTAssertEqual(attributedString.string, md.attributedString, "attributed string did not match expected. Attributed String = \(attributedString.string)")
        }
    }
    
    func testMarkdownStringToAttributedString() {
        for md in markdownSamples {
            guard let attributedString = try? NSAttributedString(markdownString: md.markdownString) else {
                XCTFail("Should be working")
                return
            }
            
            XCTAssertEqual(attributedString.string, md.attributedString, "attributed string did not match expected. Attributed String = \(attributedString.string)")
        }
    }
}
