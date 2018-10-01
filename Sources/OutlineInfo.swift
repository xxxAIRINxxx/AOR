//
//  OutlineInfo.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/04/01.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public struct OutlineInfo {
    
    public let color: UIColor
    public let width: CGFloat
    
    public init(_ color: UIColor, _ width: CGFloat) {
        self.color = color
        self.width = width
    }
    
    public var textAttrubute: TextAttrubute {
        return [
            NSAttributedString.Key.strokeColor : self.color,
            NSAttributedString.Key.strokeWidth : self.width
        ]
    }
}
