//
//  StringConvenienceTests.swift
//  Example
//
//  Created by Jason Grandelli on 10/25/16.
//  Copyright © 2016 URBN. All rights reserved.
//

import XCTest
import URBNMrkDwn

class StringConvenienceTests: XCTestCase {
    func testMarkDownStringToHTML() {
        for md in markdownSamples {
            guard let renderedHTMLString = try? md.markdownString.toHTML() else {
                XCTFail("Should be working")
                return
            }
            
            XCTAssertEqual(renderedHTMLString, md.htmlString, "rendered HTML did not match expected. Rendered = \(renderedHTMLString)")
        }
    }
}
