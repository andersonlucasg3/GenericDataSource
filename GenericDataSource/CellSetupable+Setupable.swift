//
//  CellSetupable+Setupable.swift
//  GenericDataSource
//
//  Created by Anderson Lucas de Castro Ramos on 21/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import Foundation

public protocol CellSetupable : class {
    func setup(withAny any: Any)
}

public protocol Setupable : CellSetupable {
    associatedtype DataType
    
    func setup(with data: DataType)
}

public extension Setupable {
    func setup(withAny any: Any) {
        self.setup(with: any as! Self.DataType)
    }
}

