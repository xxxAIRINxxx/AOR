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
    
    var styleKey: String {
        switch self {
        case .strikethrough: return NSStrikethroughStyleAttributeName
        case .underline: return NSUnderlineStyleAttributeName
        }
    }
    
    var colorKey: String {
        switch self {
        case .strikethrough: return NSStrikethroughColorAttributeName
        case .underline: return NSUnderlineColorAttributeName
        }
    }
}

public enum LineStyle {
    case none
    case single
    case thick
    case double
    
    var rawValue: Int {
        switch self {
        case .none: return NSUnderlineStyle.styleNone.rawValue
        case .single: return NSUnderlineStyle.styleSingle.rawValue
        case .thick: return NSUnderlineStyle.styleThick.rawValue
        case .double: return NSUnderlineStyle.styleDouble.rawValue
        }
    }
}

public enum LinePattern {
    case solid
    case dot
    case dash
    case dashDot
    case dashDotDot
    
    var rawValue: Int {
        switch self {
        case .solid: return NSUnderlineStyle.styleNone.rawValue
        case .dot: return NSUnderlineStyle.patternDot.rawValue
        case .dash: return NSUnderlineStyle.patternDash.rawValue
        case .dashDot: return NSUnderlineStyle.patternDashDot.rawValue
        case .dashDotDot: return NSUnderlineStyle.patternDashDotDot.rawValue
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
            a[type.styleKey] = self.style.rawValue | self.pattern.rawValue | NSUnderlineStyle.byWord.rawValue
        } else {
            a[type.styleKey] = self.style.rawValue | self.pattern.rawValue
        }
        
        if let c = self.color {
            a[type.colorKey] = c
        }
        
        return a
    }
}
