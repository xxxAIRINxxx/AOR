//
//  LineInfo.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/04/01.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public enum LineType {
    case Strikethrough
    case Underline
    
    var styleKey: String {
        switch self {
        case .Strikethrough: return NSStrikethroughStyleAttributeName
        case .Underline: return NSUnderlineStyleAttributeName
        }
    }
    
    var colorKey: String {
        switch self {
        case .Strikethrough: return NSStrikethroughColorAttributeName
        case .Underline: return NSUnderlineColorAttributeName
        }
    }
}

public enum LineStyle {
    case None
    case Single
    case Thick
    case Double
    
    var rawValue: Int {
        switch self {
        case .None: return NSUnderlineStyle.StyleNone.rawValue
        case .Single: return NSUnderlineStyle.StyleSingle.rawValue
        case .Thick: return NSUnderlineStyle.StyleThick.rawValue
        case .Double: return NSUnderlineStyle.StyleDouble.rawValue
        }
    }
}

public enum LinePattern {
    case Solid
    case Dot
    case Dash
    case DashDot
    case DashDotDot
    
    var rawValue: Int {
        switch self {
        case .Solid: return NSUnderlineStyle.PatternSolid.rawValue
        case .Dot: return NSUnderlineStyle.PatternDot.rawValue
        case .Dash: return NSUnderlineStyle.PatternDash.rawValue
        case .DashDot: return NSUnderlineStyle.PatternDashDot.rawValue
        case .DashDotDot: return NSUnderlineStyle.PatternDashDotDot.rawValue
        }
    }
}

public struct LineInfo {
    
    public let type : LineType
    public let color: UIColor?
    public let style: LineStyle
    public let pattern: LinePattern
    public let isLineByWord: Bool
    
    public init(_ type: LineType, _ color: UIColor?, _ style: LineStyle, _ pattern: LinePattern, _ isLineByWord: Bool = true) {
        self.type = type
        self.color = color
        self.style = style
        self.pattern = pattern
        self.isLineByWord = isLineByWord
    }
    
    public var textAttrubute: TextAttrubute {
        var a: TextAttrubute = [:]
        
        if self.isLineByWord {
            a[type.styleKey] = self.style.rawValue | self.pattern.rawValue | NSUnderlineStyle.ByWord.rawValue
        } else {
            a[type.styleKey] = self.style.rawValue | self.pattern.rawValue
        }
        
        if let c = self.color {
            a[type.colorKey] = c
        }
        
        return a
    }
}
