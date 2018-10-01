//
//  LineInfo.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/04/01.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public enum LineType {
    case strikethrough
    case underline
    
    var styleKey: NSAttributedString.Key {
        switch self {
        case .strikethrough: return NSAttributedString.Key.strikethroughStyle
        case .underline: return NSAttributedString.Key.underlineStyle
        }
    }
    
    var colorKey: NSAttributedString.Key {
        switch self {
        case .strikethrough: return NSAttributedString.Key.strikethroughColor
        case .underline: return NSAttributedString.Key.underlineColor
        }
    }
}

public enum LineStyle {
    case single
    case thick
    case double
    
    var rawValue: NSUnderlineStyle {
        switch self {
        case .single: return NSUnderlineStyle.single
        case .thick: return NSUnderlineStyle.thick
        case .double: return NSUnderlineStyle.double
        }
    }
}

public enum LinePattern {
    case dot
    case dash
    case dashDot
    case dashDotDot
    
    var rawValue: NSUnderlineStyle {
        switch self {
        case .dot: return NSUnderlineStyle.patternDot
        case .dash: return NSUnderlineStyle.patternDash
        case .dashDot: return NSUnderlineStyle.patternDashDot
        case .dashDotDot: return NSUnderlineStyle.patternDashDotDot
        }
    }
}

public struct LineInfo {
    
    public let type : LineType
    public let color: UIColor?
    public let style: LineStyle
    public let pattern: LinePattern?
    public let isLineByWord: Bool
    
    public init(_ type: LineType, _ color: UIColor?, _ style: LineStyle, _ pattern: LinePattern?, _ isLineByWord: Bool = true) {
        self.type = type
        self.color = color
        self.style = style
        self.pattern = pattern
        self.isLineByWord = isLineByWord
    }
    
    public var textAttrubute: TextAttrubute {
        var a: TextAttrubute = [:]
        
        var s = self.style.rawValue
        if let p = self.pattern?.rawValue {
            s.insert(p)
        }
        if self.isLineByWord {
            s.insert(NSUnderlineStyle.byWord)
        }
        a[type.styleKey] = s.rawValue
        
        if let c = self.color {
            a[type.colorKey] = c
        }
        
        return a
    }
}
