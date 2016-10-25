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
        var mrkdwnString = "*italics*\r\n* asterisks Bullet \r\n\r\n+ plus sign Bullet \r\n\r\n- hyphen Bullet \r\n\r\n"
        var expectedHTMLString = "<p><em>italics</em></p>\n<ul>\n<li>asterisks Bullet</li>\n</ul>\n<ul>\n<li>plus sign Bullet</li>\n</ul>\n<ul>\n<li>hyphen Bullet</li>\n</ul>\n"
        var renderedHTMLString = try? Renderers.renderHTMLFromMarkdown(mrkdwnString)

        XCTAssertEqual(renderedHTMLString, expectedHTMLString, "rendered HTML did not match expected. Rendered = \(renderedHTMLString)")
        
        mrkdwnString = "# This is an H1 \r\n* list 1 \r\n\r\n* list 2"
        expectedHTMLString = "<h1>This is an H1</h1>\n<ul>\n<li>\n<p>list 1</p>\n</li>\n<li>\n<p>list 2</p>\n</li>\n</ul>\n"
        renderedHTMLString = try? Renderers.renderHTMLFromMarkdown(mrkdwnString)
        
        XCTAssertEqual(renderedHTMLString, expectedHTMLString, "rendered HTML did not match expected. Rendered = \(renderedHTMLString)")
    }
}
