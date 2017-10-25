//
//  Attribute.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public typealias TextAttrubute = [NSAttributedStringKey : Any]

public enum Attribute {
    case font(UIFont)
    case paragraphStyle(ParagraphInfo)
    case foregroundColor(UIColor)
    case backgroundColor(UIColor)
    case ligature(Int)
    case kern(Float)
    case line(LineInfo)
    case outline(OutlineInfo)
    case shadow(ShadowInfo)
    case textEffect(TextEffectType)
    case attachment(NSTextAttachment)
    case link(String)
    case baselineOffset(Float)
    case obliqueness(Float)
    case expansion(Float)
    case writingDirection([UnicodeWritingDirection])
    case verticalGlyphForm
    case custom(NSAttributedStringKey, Any)
    
    public var key: NSAttributedStringKey {
        switch self {
        case .font: return NSAttributedStringKey.font
        case .paragraphStyle: return NSAttributedStringKey(rawValue: "") // no uses
        case .foregroundColor: return NSAttributedStringKey.foregroundColor
        case .backgroundColor: return NSAttributedStringKey.backgroundColor
        case .ligature: return NSAttributedStringKey.ligature
        case .kern: return NSAttributedStringKey.kern
        case .line: return NSAttributedStringKey(rawValue: "") // no uses
        case .outline: return NSAttributedStringKey(rawValue: "") // no uses
        case .shadow: return NSAttributedStringKey(rawValue: "") // no uses
        case .textEffect: return NSAttributedStringKey.textEffect
        case .attachment: return NSAttributedStringKey.attachment
        case .link: return NSAttributedStringKey.link
        case .baselineOffset: return NSAttributedStringKey.baselineOffset
        case .obliqueness: return NSAttributedStringKey.obliqueness
        case .expansion: return NSAttributedStringKey.expansion
        case .writingDirection: return NSAttributedStringKey.writingDirection
        case .verticalGlyphForm: return NSAttributedStringKey.verticalGlyphForm
        case .custom(let key, _): return key
        }
    }
    
    public var attribute: TextAttrubute {
        switch self {
        case .font(let value): return [self.key : value]
        case .paragraphStyle(let value): return value.textAttrubute
        case .foregroundColor(let value): return [self.key : value]
        case .backgroundColor(let value): return [self.key : value]
        case .ligature(let value): return [self.key : NSNumber.init(value: value as Int)]
        case .kern(let value): return [self.key : NSNumber.init(value: value as Float)]
        case .line(let value): return value.textAttrubute
        case .outline(let value): return value.textAttrubute
        case .shadow(let value): return value.textAttrubute
        case .textEffect(let value): return [self.key : value.string as AnyObject]
        case .attachment(let value): return [self.key : value]
        case .link(let value): return [self.key : value as AnyObject]
        case .baselineOffset(let value): return [self.key : NSNumber.init(value: value as Float)]
        case .obliqueness(let value): return [self.key : NSNumber.init(value: value as Float)]
        case .expansion(let value): return [self.key : NSNumber.init(value: value as Float)]
        case .writingDirection(let value): return [self.key : NSArray.init(array: value.map({ NSNumber.init(value: $0.rawValue as Int) }))]
        case .verticalGlyphForm: return [self.key : NSNumber.init(value: 0 as Int)]
        case .custom(let key, let value): return [key : value]
        }
    }
}

public enum TextEffectType {
    case letterpressStyle
    
    public var string: String {
        switch self {
        case .letterpressStyle: return NSAttributedString.TextEffectStyle.letterpressStyle.rawValue
        }
    }
}

public enum UnicodeWritingDirection: Int {
    case lre = 0  // NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding
    case rle = 1  // NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding
    case lro = 2  // NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride
    case rlo = 3  // NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride
}
