//
//  ViewController.swift
//  Demo
//
//  Created by xxxAIRINxxx on 2016/01/27.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import UIKit
import AOR

final class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Basics
        
        let a = AOR("AOR Example")
            .append("\n\n")
            .append("ForegroundColor", .foregroundColor(UIColor.blue))
            .append("\n\n")
            .append("BackgroundColor", .backgroundColor(UIColor.blue))
            .append("\n\n")
            .append("Font (Cochin-BoldItalic)", .font(UIFont(name: "Cochin-BoldItalic", size: 30)!))
            .append("\n\n")
            .append("StrikethroughStyle StyleSingle\n", Attribute.line(LineInfo(.strikethrough, nil, .single, nil, false)))
            .append("StrikethroughStyle StyleThick\n", Attribute.line(LineInfo(.strikethrough, nil, .thick, nil, false)))
            .append("StrikethroughStyle StyleDouble\n", .line(LineInfo(.strikethrough, nil, .double, nil, false)))
            .append("StrikethroughStyle PatternSolid\n", .line(LineInfo(.strikethrough, nil, .single, nil, false)))
            .append("StrikethroughStyle PatternDot\n", .line(LineInfo(.strikethrough, nil, .single, .dot, false)))
            .append("StrikethroughStyle PatternDash\n", .line(LineInfo(.strikethrough, nil, .single, .dash, false)))
            .append("StrikethroughStyle PatternDashDot\n", .line(LineInfo(.strikethrough, nil, .single, .dashDot, false)))
            .append("StrikethroughStyle PatternDashDotDot\n", .line(LineInfo(.strikethrough, nil, .single, .dashDotDot, false)))
            .append("StrikethroughStyle ByWord", .line(LineInfo(.strikethrough, nil, .single, nil, true)))
            .append("\n\n")
            .append("UnderlineStyle StyleSingle\n", .line(LineInfo(.underline, nil, .single, nil, false)))
            .append("UnderlineStyle StyleThick\n", .line(LineInfo(.underline, nil, .thick, nil, false)))
            .append("UnderlineStyle StyleDouble\n", .line(LineInfo(.underline, nil, .double, nil, false)))
            .append("UnderlineStyle PatternSolid\n", .line(LineInfo(.underline, nil, .single, nil, false)))
            .append("UnderlineStyle PatternDot\n", .line(LineInfo(.underline, nil, .single, .dot, false)))
            .append("UnderlineStyle PatternDash\n", .line(LineInfo(.underline, nil, .single, .dash, false)))
            .append("UnderlineStyle PatternDashDot\n", .line(LineInfo(.underline, nil, .single, .dashDot, false)))
            .append("UnderlineStyle PatternDashDotDot\n", .line(LineInfo(.underline, nil, .single, .dashDotDot, false)))
            .append("UnderlineStyle ByWord", .line(LineInfo(.underline, nil, .single, nil, true)))
            .append("\n\n")
            .append("Outline", .outline(OutlineInfo(UIColor.blue, 1.0)))
            .append("\n\n")
        
        // Multiple
        
        let b = AOR("Multiple Attributes", [
                .foregroundColor(UIColor.blue),
                .line(LineInfo(.strikethrough, UIColor.black, .single, .dash, false)),
            ])
        
        // Custom Operator
        
        let c = AOR("\n\n")
            +| AOR("Shadow", .shadow(ShadowInfo(CGSize.zero, UIColor.red, 5.0)))
            +| AOR("\n\n")
            +| AOR("TextEffect", .textEffect(.letterpressStyle))
            +| AOR("\n\n")
            +| AOR("ForegroundColor", .foregroundColor(UIColor.blue))
            +| AOR("\n\n")
            +| AOR("Twitter", .link("https://twitter.com/search-home"))
            +| AOR("\n\n")
        
        // Paragraph
        
        let p = ParagraphInfo()
            .lineSpacing(10.0)
            .minimumLineHeight(15.0)
            .firstLineHeadIndent(30.0)
        let d = AOR("Paragraph\nStyle\nAttribute", .paragraphStyle(p))
        
        self.textView.attributedText = (a +| b +| c +| d).put()
        
        print(a.aor_textKitDebugPrint(self.textView.frame.size))
    }
}
