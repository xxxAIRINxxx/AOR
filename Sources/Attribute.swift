//
//  Attribute.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public typealias TextAttrubute = [String : Any]

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
    case custom(String, AnyObject)
    
    public var key: String {
        switch self {
        case .font: return NSFontAttributeName
        case .paragraphStyle: return "" // no uses
        case .foregroundColor: return NSForegroundColorAttributeName
        case .backgroundColor: return NSBackgroundColorAttributeName
        case .ligature: return NSLigatureAttributeName
        case .kern: return NSKernAttributeName
        case .line: return "" // no uses
        case .outline: return "" // no uses
        case .shadow: return "" // no uses
        case .textEffect: return NSTextEffectAttributeName
        case .attachment: return NSAttachmentAttributeName
        case .link: return NSLinkAttributeName
        case .baselineOffset: return NSBaselineOffsetAttributeName
        case .obliqueness: return NSObliquenessAttributeName
        case .expansion: return NSExpansionAttributeName
        case .writingDirection: return NSWritingDirectionAttributeName
        case .verticalGlyphForm: return NSVerticalGlyphFormAttributeName
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
        case .letterpressStyle: return NSTextEffectLetterpressStyle
        }
    }
}

public enum UnicodeWritingDirection: Int {
    case lre = 0  // NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding
    case rle = 1  // NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding
    case lro = 2  // NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride
    case rlo = 3  // NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride
}
