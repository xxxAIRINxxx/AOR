//: Playground - noun: a place where people can play

import UIKit
import AOR

/// AOR Example


/// ForegroundColor

AOR("ForegroundColor", .ForegroundColor(UIColor.blueColor())).put()

/// BackgroundColor

AOR("BackgroundColor", .BackgroundColor(UIColor.blueColor())).put()

/// Line

AOR("StrikethroughStyle PatternDashDotDot", .Line(LineInfo(.Strikethrough, UIColor.whiteColor(), .Single, .DashDotDot, false))).put()

/// Outline

AOR("Outline", .Outline(OutlineInfo(UIColor.whiteColor(), 1.0))).put()

/// Multiple Attributes

AOR("Multiple Attributes", [
    .ForegroundColor(UIColor.blueColor()),
    .Line(LineInfo(.Strikethrough, UIColor.blackColor(), .Single, .Dash, false)),
    ]).put()

/// Adding Attributes

AOR("ForegroundColor", .ForegroundColor(UIColor.blueColor()))
    .append("BackgroundColor", .BackgroundColor(UIColor.blueColor()))
    .put()

/// Adding Attributes (Custom Operator)

let a = AOR("ForegroundColor", .ForegroundColor(UIColor.blueColor()))
        +| AOR("BackgroundColor", .BackgroundColor(UIColor.blueColor()))
a.put()

/// Paragraph

let p = ParagraphInfo()
    .lineSpacing(10.0)
    .minimumLineHeight(15.0)
    .firstLineHeadIndent(30.0)
let d = AOR("Paragraph\nStyle\nAttribute", .ParagraphStyle(p)).put()

//　Following, please look at the demo project
