//
//  NSObjectProtocol+Extensions.swift
//  GenericDataSource
//
//  Created by Anderson Lucas de Castro Ramos on 21/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import Foundation

public extension NSObjectProtocol {
    static var className: String {
        let fullClassName = NSStringFromClass(self)
        let comps = fullClassName.split(separator: ".")
        if comps.count == 2 {
            return String.init(comps[1])
        }
        return String.init(comps[0])
    }
}
