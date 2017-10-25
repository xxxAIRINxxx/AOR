//
//  ParagraphInfo.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public struct ParagraphInfo {
    
    fileprivate let paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
    
    public init() {}
    
    public var textAttrubute: TextAttrubute {
        return [NSAttributedStringKey.paragraphStyle : self.paragraph]
    }
}

extension ParagraphInfo {
    
    public func lineSpacing(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.lineSpacing = value
        return self
    }
    
    public func paragraphSpacing(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.paragraphSpacing = value
        return self
    }
    
    public func alignment(_ value: NSTextAlignment) -> ParagraphInfo {
        self.paragraph.alignment = value
        return self
    }
    
    public func firstLineHeadIndent(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.firstLineHeadIndent = value
        return self
    }
    
    public func headIndent(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.headIndent = value
        return self
    }
    
    public func tailIndent(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.tailIndent = value
        return self
    }
    
    public func lineBreakMode(_ value: NSLineBreakMode) -> ParagraphInfo {
        self.paragraph.lineBreakMode = value
        return self
    }
    
    public func minimumLineHeight(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.minimumLineHeight = value
        return self
    }
    
    public func maximumLineHeight(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.maximumLineHeight = value
        return self
    }
    
    public func baseWritingDirection(_ value: NSWritingDirection) -> ParagraphInfo {
        self.paragraph.baseWritingDirection = value
        return self
    }
    
    public func lineHeightMultiple(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.lineHeightMultiple = value
        return self
    }
    
    public func paragraphSpacingBefore(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.paragraphSpacingBefore = value
        return self
    }
    
    public func hyphenationFactor(_ value: Float) -> ParagraphInfo {
        self.paragraph.hyphenationFactor = value
        return self
    }
    
    public func tabStops(_ value: [NSTextTab]) -> ParagraphInfo {
        self.paragraph.tabStops = value
        return self
    }
    
    public func defaultTabInterval(_ value: CGFloat) -> ParagraphInfo {
        self.paragraph.defaultTabInterval = value
        return self
    }
    
    @available(iOS 9.0, *)
    public func allowsDefaultTighteningForTruncation(_ value: Bool) -> ParagraphInfo {
        self.paragraph.allowsDefaultTighteningForTruncation = value
        return self
    }
}
