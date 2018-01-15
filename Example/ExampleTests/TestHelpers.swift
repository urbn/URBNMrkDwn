//
//  TestHelpers.swift
//  Example
//
//  Created by Jason Grandelli on 10/25/16.
//  Copyright © 2016 URBN. All rights reserved.
//

import Foundation
import UIKit

//Stores markdown & rendered HTML for tests
struct MarkDownSample {
    let markdownString: String
    let htmlString: String
    var attributedString: String? {
        guard let data = htmlString.data(using: .utf8) else { return nil }
        
        let opt: [NSAttributedString.DocumentReadingOptionKey: Any] = [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue]
        let att = try? NSAttributedString(data: data, options: opt, documentAttributes: nil)

        return att?.string
    }
}

let markdownSamples = [
    MarkDownSample(markdownString: "*italics*\r\n* asterisks Bullet \r\n\r\n+ plus sign Bullet \r\n\r\n- hyphen Bullet \r\n\r\n", htmlString: "<p><em>italics</em></p>\n<ul>\n<li>asterisks Bullet</li>\n</ul>\n<ul>\n<li>plus sign Bullet</li>\n</ul>\n<ul>\n<li>hyphen Bullet</li>\n</ul>\n"),

    MarkDownSample(markdownString: "# This is an H1 \r\n* list 1 \r\n\r\n* list 2", htmlString: "<h1>This is an H1</h1>\n<ul>\n<li>\n<p>list 1</p>\n</li>\n<li>\n<p>list 2</p>\n</li>\n</ul>\n"),
    
    MarkDownSample(markdownString: "* Cotton gauze\n* Side slant, back patch pockets\n* Button front with drawstring waist\n* Dry clean\n* USA\n", htmlString: "<ul>\n<li>Cotton gauze</li>\n<li>Side slant, back patch pockets</li>\n<li>Button front with drawstring waist</li>\n<li>Dry clean</li>\n<li>USA</li>\n</ul>\n"),
    
    MarkDownSample(markdownString: "  * 53.5\"L\n  * 25.5\" inseam\n\n", htmlString: "<ul>\n<li>53.5&quot;L</li>\n<li>25.5&quot; inseam</li>\n</ul>\n"),
    
    MarkDownSample(markdownString: "* Rayon \n* Elasticized waist \n* Pull-on styling \n* Dry clean \n* USA\n\n", htmlString: "<ul>\n<li>Rayon</li>\n<li>Elasticized waist</li>\n<li>Pull-on styling</li>\n<li>Dry clean</li>\n<li>USA</li>\n</ul>\n"),
    
    MarkDownSample(markdownString: "* 25\"L\n* 3\" inseam", htmlString: "<ul>\n<li>25&quot;L</li>\n<li>3&quot; inseam</li>\n</ul>\n"),
    
    MarkDownSample(markdownString: "* Tiber palette \n \n \n \n * Durable top-grain leather upholstery is supple and scratch-resistant \n \n \n \n * Kiln-dried maple wood frame \n \n \n \n * High-resiliency foam core cushions are wrapped in soft fiber padding, guaranteeing a firm, structured seat with a streamlined silhouette \n \n \n \n * Walker finish \n \n \n \n * Legs are not removable \n \n \n \n * Clean with purified water, then dry with a soft cloth \n \n \n \n * Handcrafted in USA \n \n \n \n * Select colors are made to order. The \"available by\" date shown above indicates the estimated ship date\n\n", htmlString: "<ul>\n<li>Tiber palette</li>\n</ul>\n<ul>\n<li>Durable top-grain leather upholstery is supple and scratch-resistant</li>\n</ul>\n<ul>\n<li>Kiln-dried maple wood frame</li>\n</ul>\n<ul>\n<li>High-resiliency foam core cushions are wrapped in soft fiber padding, guaranteeing a firm, structured seat with a streamlined silhouette</li>\n</ul>\n<ul>\n<li>Walker finish</li>\n</ul>\n<ul>\n<li>Legs are not removable</li>\n</ul>\n<ul>\n<li>Clean with purified water, then dry with a soft cloth</li>\n</ul>\n<ul>\n<li>Handcrafted in USA</li>\n</ul>\n<ul>\n<li>Select colors are made to order. The &quot;available by&quot; date shown above indicates the estimated ship date</li>\n</ul>\n"),
    
    MarkDownSample(markdownString: "* 34\"H, 90\"W, 36\"D\n* Seat: 18\"H, 18''D\n* 9\" under seat clearance", htmlString: "<ul>\n<li>34&quot;H, 90&quot;W, 36&quot;D</li>\n<li>Seat: 18&quot;H, 18\'\'D</li>\n<li>9&quot; under seat clearance</li>\n</ul>\n"),
    
    MarkDownSample(markdownString: "Consider this our take on Brazilian lounge lizard furniture - handcrafted from solid \nmaple and covered in soft leather that buckles at the sides like a valise. \n \nOur furniture specialists are at the ready to help you find the right fit for \nyour lifestyle and needs. Give us a call at [844.599.2557](tel:844.599.2557) \nfrom 7 a.m. to midnight, any day of the week. For aesthetic advice and tips to \nhelp decorate your space, email \n[homestylist@anthropologie.com.](mailto:homestylist@anthropologie.com?Subject=anthropologie%20home%20stylist%20inquiry)\n\n", htmlString: "<p>Consider this our take on Brazilian lounge lizard furniture - handcrafted from solid\nmaple and covered in soft leather that buckles at the sides like a valise.</p>\n<p>Our furniture specialists are at the ready to help you find the right fit for\nyour lifestyle and needs. Give us a call at <a href=\"tel:844.599.2557\">844.599.2557</a>\nfrom 7 a.m. to midnight, any day of the week. For aesthetic advice and tips to\nhelp decorate your space, email\n<a href=\"mailto:homestylist@anthropologie.com?Subject=anthropologie%20home%20stylist%20inquiry\">homestylist@anthropologie.com.</a></p>\n"),
    
    MarkDownSample(markdownString: "\n\n\n  * Tiber palette\n\n\n\n  * Durable, top-grain leather upholstery is supple and scratch-resistant\n\n\n\n  * Kiln-dried maple wood frame\n\n\n\n  * High-resiliency foam core cushions are wrapped in soft fiber padding, guaranteeing a firm, structured seat with a streamlined silhouette\n\n\n\n  * Walker finish\n\n\n\n  * Legs are not removable\n\n\n\n  * Clean with purified water, then dry with a soft cloth\n\n\n\n  * Handcrafted in USA\n\n\n\n  * Select colors are made to order. The \"available by\" date shown above indicates the estimated ship date\n\n\n\n", htmlString: "<ul>\n<li>Tiber palette</li>\n</ul>\n<ul>\n<li>Durable, top-grain leather upholstery is supple and scratch-resistant</li>\n</ul>\n<ul>\n<li>Kiln-dried maple wood frame</li>\n</ul>\n<ul>\n<li>High-resiliency foam core cushions are wrapped in soft fiber padding, guaranteeing a firm, structured seat with a streamlined silhouette</li>\n</ul>\n<ul>\n<li>Walker finish</li>\n</ul>\n<ul>\n<li>Legs are not removable</li>\n</ul>\n<ul>\n<li>Clean with purified water, then dry with a soft cloth</li>\n</ul>\n<ul>\n<li>Handcrafted in USA</li>\n</ul>\n<ul>\n<li>Select colors are made to order. The &quot;available by&quot; date shown above indicates the estimated ship date</li>\n</ul>\n"),
]

