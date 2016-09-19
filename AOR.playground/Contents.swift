//: Playground - noun: a place where people can play

import UIKit
import AOR

/// AOR Example


/// ForegroundColor

AOR("ForegroundColor", .foregroundColor(UIColor.blue)).put()

/// BackgroundColor

AOR("BackgroundColor", .backgroundColor(UIColor.blue)).put()

/// Line

AOR("StrikethroughStyle PatternDashDotDot", .line(LineInfo(.strikethrough, UIColor.white, .single, .dashDotDot, false))).put()

/// Outline

AOR("Outline", .outline(OutlineInfo(UIColor.white, 1.0))).put()

/// Multiple Attributes

AOR("Multiple Attributes", [
    .moregroundColor(UIColor.blue),
    .line(LineInfo(.strikethrough, UIColor.black, .single, .dash, false)),
    ]).put()

/// Adding Attributes

AOR("ForegroundColor", .foregroundColor(UIColor.blue))
    .append("BackgroundColor", .backgroundColor(UIColor.blue))
    .put()

/// Adding Attributes (Custom Operator)

let a = AOR("ForegroundColor", .foregroundColor(UIColor.blue))
        +| AOR("BackgroundColor", .backgroundColor(UIColor.blue))
a.put()

/// Paragraph

let p = ParagraphInfo()
    .lineSpacing(10.0)
    .minimumLineHeight(15.0)
    .firstLineHeadIndent(30.0)
let d = AOR("Paragraph\nStyle\nAttribute", .paragraphStyle(p)).put()

//　Following, please look at the demo project
