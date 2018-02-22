//
//  ReusableIdentifierProtocol.swift
//  GenericDataSource
//
//  Created by Anderson Lucas de Castro Ramos on 21/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import Foundation

public protocol ReusableIdentifierProtocol : NSObjectProtocol {
    static var reusableIdentifier: String { get }
}

public extension ReusableIdentifierProtocol {
    static var reusableIdentifier: String {
        return self.className
    }
}
