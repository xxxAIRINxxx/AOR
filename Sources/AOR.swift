//
//  AOR.swift
//  AOR
//
//  Created by xxxAIRINxxx on 2016/01/25.
//  Copyright © 2016 xxxAIRINxxx. All rights reserved.
//

import Foundation

public struct AOR {
    
    internal let store: NSTextStorage = NSTextStorage()
    
    // Texkit Support
    public var lineFragmentPadding: CGFloat = 5.0
    public var maximumNumberOfLines: Int = 0
    
    public init() {}
    
    public init(_ text: String, _ attribute: Attribute? = nil) {
        self.append(text, attribute)
    }
    
    public init(_ text: String, _ attributes: [Attribute]) {
        self.append(text, attributes)
    }
    
    public func append(text: String, _ attribute: Attribute? = nil) -> AOR {
        self.store.appendAttributedString(NSAttributedString(string: text, attributes: attribute?.attribute))
        return self
    }
    
    public func append(text: String, _ attributes: [Attribute]) -> AOR {
        let m = NSMutableAttributedString(string: text)
        attributes.forEach() { m.addAttributes($0.attribute, range: NSRange(location: 0, length: m.length)) }
        self.store.appendAttributedString(m)
        return self
    }
    
    public func put() -> NSAttributedString {
        return self.store
    }
}

// MARK:- Custom Operator

infix operator +| { associativity right precedence 50 }

public func +|(l: AOR, r: AOR) -> AOR {
    l.store.appendAttributedString(r.store)
    return l
}