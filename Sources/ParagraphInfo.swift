//
//  ParagraphInfo.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public struct ParagraphInfo {
    
    private let paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
    
    public init() {}
    
    public var textAttrubute: TextAttrubute {
        return [NSParagraphStyleAttributeName : self.paragraph]
    }
}

extension ParagraphInfo {
    
    public func lineSpacing(value: CGFloat) -> ParagraphInfo {
        self.paragraph.lineSpacing = value
        return self
    }
    
    public func paragraphSpacing(value: CGFloat) -> ParagraphInfo {
        self.paragraph.paragraphSpacing = value
        return self
    }
    
    public func alignment(value: NSTextAlignment) -> ParagraphInfo {
        self.paragraph.alignment = value
        return self
    }
    
    public func firstLineHeadIndent(value: CGFloat) -> ParagraphInfo {
        self.paragraph.firstLineHeadIndent = value
        return self
    }
    
    public func headIndent(value: CGFloat) -> ParagraphInfo {
        self.paragraph.headIndent = value
        return self
    }
    
    public func tailIndent(value: CGFloat) -> ParagraphInfo {
        self.paragraph.tailIndent = value
        return self
    }
    
    public func lineBreakMode(value: NSLineBreakMode) -> ParagraphInfo {
        self.paragraph.lineBreakMode = value
        return self
    }
    
    public func minimumLineHeight(value: CGFloat) -> ParagraphInfo {
        self.paragraph.minimumLineHeight = value
        return self
    }
    
    public func maximumLineHeight(value: CGFloat) -> ParagraphInfo {
        self.paragraph.maximumLineHeight = value
        return self
    }
    
    public func baseWritingDirection(value: NSWritingDirection) -> ParagraphInfo {
        self.paragraph.baseWritingDirection = value
        return self
    }
    
    public func lineHeightMultiple(value: CGFloat) -> ParagraphInfo {
        self.paragraph.lineHeightMultiple = value
        return self
    }
    
    public func paragraphSpacingBefore(value: CGFloat) -> ParagraphInfo {
        self.paragraph.paragraphSpacingBefore = value
        return self
    }
    
    public func hyphenationFactor(value: Float) -> ParagraphInfo {
        self.paragraph.hyphenationFactor = value
        return self
    }
    
    public func tabStops(value: [NSTextTab]) -> ParagraphInfo {
        self.paragraph.tabStops = value
        return self
    }
    
    public func defaultTabInterval(value: CGFloat) -> ParagraphInfo {
        self.paragraph.defaultTabInterval = value
        return self
    }
    
    @available(iOS 9.0, *)
    public func allowsDefaultTighteningForTruncation(value: Bool) -> ParagraphInfo {
        self.paragraph.allowsDefaultTighteningForTruncation = value
        return self
    }
}