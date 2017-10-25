//
//  ShadowInfo.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/06/01.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public struct ShadowInfo {
    
    public let offset: CGSize
    public let color: UIColor?
    public let blurRadius: CGFloat
    
    public init(_ offset: CGSize, _ color: UIColor?, _ blurRadius: CGFloat) {
        self.offset = offset
        self.color = color
        self.blurRadius = blurRadius
    }
    
    public var textAttrubute: TextAttrubute {
        let s = NSShadow()
        s.shadowOffset = self.offset
        s.shadowColor = self.color
        s.shadowBlurRadius = self.blurRadius
        return [NSAttributedStringKey.shadow : s]
    }
}
