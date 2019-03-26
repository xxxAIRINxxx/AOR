//
//  AOR+Debug.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

extension AOR {
    
    public func aor_textKitDebugPrint(_ size: CGSize) {
        print("AOR TextKit Debug Print -------------------------------------")
        print("usedSize : \(self.usedSize(size))")
        print("maxLineCount : \(self.maxLineCount(size.width))")
        print("lineCount : \(self.lineCount(size))")
        print("lineRects : \(self.lineRects(size))")
        print("lineRanges : \(self.lineRanges(size))")
        print("lineAttributedStrings : \(self.lineAttributedStrings(size))")
        print("lineStrings : \(self.lineStrings(size))")
        print("-----------------------------------------------------")
    }
}

extension NSLayoutManager {
    
    public func aor_debugPrint() {
        print("AOR NSLayoutManager Debug Print -------------------------------------")
        print("textContainers.count : \(self.textContainers.count)")
        print("numberOfGlyphs : \(self.numberOfGlyphs)")
        print("firstUnlaidCharacterIndex : \(String(describing: self.firstUnlaidCharacterIndex))")
        print("firstUnlaidGlyphIndex : \(String(describing: self.firstUnlaidGlyphIndex))")
        print("extraLineFragmentRect : \(self.extraLineFragmentRect)")
        print("extraLineFragmentUsedRect : \(self.extraLineFragmentUsedRect)")
        self.textContainers.forEach() {
            print("usedRectForTextContainer : \(self.usedRect(for: $0))")
            print("glyphRangeForTextContainer : \(self.glyphRange(for: $0))")
        }
        print("---------------------------------------------------------------------")
    }
}
