//
//  AOR+TextKit.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

// MARK:- TextKit Support

extension AOR {
    
    public func usedSize(_ size: CGSize) -> CGSize {
        if self.store.string.isEmpty { return CGSize.zero }
        
        var s: CGSize = CGSize.zero
        self.calculateLayout(size) { layoutManager, textContainer in
            s = layoutManager.usedRect(for: textContainer).size
        }
        
        return s
    }
    
    public func maxLineCount(_ width: CGFloat) -> Int {
        return self.lineCount(CGSize(width: width, height: CGFloat(FLT_MAX)))
    }
    
    public func lineCount(_ size: CGSize) -> Int {
        if self.store.string.isEmpty { return 0 }
        
        var lineCount: Int = 0
        self.calculateLayout(size) { layoutManager, textContainer in
            let range = layoutManager.glyphRange(for: textContainer)
            layoutManager.enumerateLineFragments(forGlyphRange: range) { (_, _, _, _, _) in lineCount += 1 }
        }
        
        return lineCount
    }
    
    public func lineRects(_ size: CGSize) -> [CGRect] {
        if self.store.string.isEmpty { return [] }
        
        var r: [CGRect] = []
        self.calculateLayout(size) { layoutManager, textContainer in
            let range = layoutManager.glyphRange(for: textContainer)
            layoutManager.enumerateLineFragments(forGlyphRange: range) { (rect, usedRect, con, range, stop) in r.append(usedRect) }
        }
        
        return r
    }
    
    public func lineRanges(_ size: CGSize) -> [NSRange] {
        if self.store.string.isEmpty { return [] }
        
        var r: [NSRange] = []
        self.calculateLayout(size) { layoutManager, textContainer in
            let range = layoutManager.glyphRange(for: textContainer)
            layoutManager.enumerateLineFragments(forGlyphRange: range) { (rect, usedRect, con, range, stop) in r.append(range) }
        }
        
        return r
    }
    
    public func lineAttributedStrings(_ size: CGSize) -> [NSAttributedString] {
        if self.store.string.isEmpty { return [] }
        
        var r: [NSRange] = []
        self.calculateLayout(size) { layoutManager, textContainer in
            let range = layoutManager.glyphRange(for: textContainer)
            layoutManager.enumerateLineFragments(forGlyphRange: range) { (rect, usedRect, con, range, stop) in r.append(range) }
        }
        
        return r.map() { self.store.attributedSubstring(from: $0) }
    }
    
    public func lineStrings(_ size: CGSize) -> [String] {
        return self.lineAttributedStrings(size).map() { $0.string }
    }
    
    fileprivate func calculateLayout(_ size: CGSize, _ closure: ((NSLayoutManager, NSTextContainer) -> Void)) {
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: size)
        textContainer.lineFragmentPadding = self.lineFragmentPadding
        textContainer.maximumNumberOfLines = self.maximumNumberOfLines
        layoutManager.addTextContainer(textContainer)
        
        self.store.addLayoutManager(layoutManager)
        defer { self.store.removeLayoutManager(layoutManager) }
        
        closure(layoutManager, textContainer)
    }
}
