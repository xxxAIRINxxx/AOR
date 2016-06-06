//
//  Attribute.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public typealias TextAttrubute = [String : AnyObject]

public enum Attribute {
    case Font(UIFont)
    case ParagraphStyle(ParagraphInfo)
    case ForegroundColor(UIColor)
    case BackgroundColor(UIColor)
    case Ligature(Int)
    case Kern(Float)
    case Line(LineInfo)
    case Outline(OutlineInfo)
    case Shadow(ShadowInfo)
    case TextEffect(TextEffectType)
    case Attachment(NSTextAttachment)
    case Link(String)
    case BaselineOffset(Float)
    case Obliqueness(Float)
    case Expansion(Float)
    case WritingDirection([UnicodeWritingDirection])
    case VerticalGlyphForm
    case Custom(String, AnyObject)
    
    public var key: String {
        switch self {
        case .Font: return NSFontAttributeName
        case .ParagraphStyle: return "" // no uses
        case .ForegroundColor: return NSForegroundColorAttributeName
        case .BackgroundColor: return NSBackgroundColorAttributeName
        case .Ligature: return NSLigatureAttributeName
        case .Kern: return NSKernAttributeName
        case .Line: return "" // no uses
        case .Outline: return "" // no uses
        case .Shadow: return "" // no uses
        case .TextEffect: return NSTextEffectAttributeName
        case .Attachment: return NSAttachmentAttributeName
        case .Link: return NSLinkAttributeName
        case .BaselineOffset: return NSBaselineOffsetAttributeName
        case .Obliqueness: return NSObliquenessAttributeName
        case .Expansion: return NSExpansionAttributeName
        case .WritingDirection: return NSWritingDirectionAttributeName
        case .VerticalGlyphForm: return NSVerticalGlyphFormAttributeName
        case .Custom(let key, _): return key
        }
    }
    
    public var attribute: TextAttrubute {
        switch self {
        case .Font(let value): return [self.key : value]
        case .ParagraphStyle(let value): return value.textAttrubute
        case .ForegroundColor(let value): return [self.key : value]
        case .BackgroundColor(let value): return [self.key : value]
        case .Ligature(let value): return [self.key : NSNumber.init(long: value)]
        case .Kern(let value): return [self.key : NSNumber.init(float: value)]
        case .Line(let value): return value.textAttrubute
        case .Outline(let value): return value.textAttrubute
        case .Shadow(let value): return value.textAttrubute
        case .TextEffect(let value): return [self.key : value.string]
        case .Attachment(let value): return [self.key : value]
        case .Link(let value): return [self.key : value]
        case .BaselineOffset(let value): return [self.key : NSNumber.init(float: value)]
        case .Obliqueness(let value): return [self.key : NSNumber.init(float: value)]
        case .Expansion(let value): return [self.key : NSNumber.init(float: value)]
        case .WritingDirection(let value): return [self.key : NSArray.init(array: value.map({ NSNumber.init(long: $0.rawValue) }))]
        case .VerticalGlyphForm: return [self.key : NSNumber.init(long: 0)]
        case .Custom(let key, let value): return [key : value]
        }
    }
}

public enum TextEffectType {
    case LetterpressStyle
    
    public var string: String {
        switch self {
        case .LetterpressStyle: return NSTextEffectLetterpressStyle
        }
    }
}

public enum UnicodeWritingDirection: Int {
    case LRE = 0  // NSWritingDirectionLeftToRight | NSTextWritingDirectionEmbedding
    case RLE = 1  // NSWritingDirectionRightToLeft | NSTextWritingDirectionEmbedding
    case LRO = 2  // NSWritingDirectionLeftToRight | NSTextWritingDirectionOverride
    case RLO = 3  // NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride
}