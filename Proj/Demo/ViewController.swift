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
            .append("ForegroundColor", .ForegroundColor(UIColor.blueColor()))
            .append("\n\n")
            .append("BackgroundColor", .BackgroundColor(UIColor.blueColor()))
            .append("\n\n")
            .append("Font (Cochin-BoldItalic)", .Font(UIFont(name: "Cochin-BoldItalic", size: 30)!))
            .append("\n\n")
            .append("StrikethroughStyle StyleSingle\n", .Line(LineInfo(.Strikethrough, nil, .Single, .Solid, false)))
            .append("StrikethroughStyle StyleThick\n", .Line(LineInfo(.Strikethrough, nil, .Thick, .Solid, false)))
            .append("StrikethroughStyle StyleDouble\n", .Line(LineInfo(.Strikethrough, nil, .Double, .Solid, false)))
            .append("StrikethroughStyle PatternSolid\n", .Line(LineInfo(.Strikethrough, nil, .Single, .Solid, false)))
            .append("StrikethroughStyle PatternDot\n", .Line(LineInfo(.Strikethrough, nil, .Single, .Dot, false)))
            .append("StrikethroughStyle PatternDash\n", .Line(LineInfo(.Strikethrough, nil, .Single, .Dash, false)))
            .append("StrikethroughStyle PatternDashDot\n", .Line(LineInfo(.Strikethrough, nil, .Single, .DashDot, false)))
            .append("StrikethroughStyle PatternDashDotDot\n", .Line(LineInfo(.Strikethrough, nil, .Single, .DashDotDot, false)))
            .append("StrikethroughStyle ByWord", .Line(LineInfo(.Strikethrough, nil, .Single, .Solid, true)))
            .append("\n\n")
            .append("UnderlineStyle StyleSingle\n", .Line(LineInfo(.Underline, nil, .Single, .Solid, false)))
            .append("UnderlineStyle StyleThick\n", .Line(LineInfo(.Underline, nil, .Thick, .Solid, false)))
            .append("UnderlineStyle StyleDouble\n", .Line(LineInfo(.Underline, nil, .Double, .Solid, false)))
            .append("UnderlineStyle PatternSolid\n", .Line(LineInfo(.Underline, nil, .Single, .Solid, false)))
            .append("UnderlineStyle PatternDot\n", .Line(LineInfo(.Underline, nil, .Single, .Dot, false)))
            .append("UnderlineStyle PatternDash\n", .Line(LineInfo(.Underline, nil, .Single, .Dash, false)))
            .append("UnderlineStyle PatternDashDot\n", .Line(LineInfo(.Underline, nil, .Single, .DashDot, false)))
            .append("UnderlineStyle PatternDashDotDot\n", .Line(LineInfo(.Underline, nil, .Single, .DashDotDot, false)))
            .append("UnderlineStyle ByWord", .Line(LineInfo(.Underline, nil, .Single, .Solid, true)))
            .append("\n\n")
            .append("Outline", .Outline(OutlineInfo(UIColor.blueColor(), 1.0)))
            .append("\n\n")
        
        // Multiple
        
        let b = AOR("Multiple Attributes", [
                .ForegroundColor(UIColor.blueColor()),
                .Line(LineInfo(.Strikethrough, UIColor.blackColor(), .Single, .Dash, false)),
            ])
        
        // Custom Operator
        
        let c = AOR("\n\n")
            +| AOR("Shadow", .Shadow(ShadowInfo(CGSize.zero, UIColor.redColor(), 5.0)))
            +| AOR("\n\n")
            +| AOR("TextEffect", .TextEffect(.LetterpressStyle))
            +| AOR("\n\n")
            +| AOR("ForegroundColor", .ForegroundColor(UIColor.blueColor()))
            +| AOR("\n\n")
            +| AOR("Twitter", .Link("https://twitter.com/search-home"))
            +| AOR("\n\n")
        
        // Paragraph
        
        let p = ParagraphInfo()
            .lineSpacing(10.0)
            .minimumLineHeight(15.0)
            .firstLineHeadIndent(30.0)
        let d = AOR("Paragraph\nStyle\nAttribute", .ParagraphStyle(p))
        
        self.textView.attributedText = (a +| b +| c +| d).put()
        
        print(a.aor_textKitDebugPrint(self.textView.frame.size))
    }
}