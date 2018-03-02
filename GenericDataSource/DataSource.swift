//
//  DataSource.swift
//  GenericDataSource
//
//  Created by Anderson Lucas de Castro Ramos on 20/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import Foundation

public protocol DataSourceProtocol {
    func getItemCount() -> Int
    func getItem<T>(for index: Int) -> T
}

open class DataSource<DataType>: DataSourceProtocol {
    public var items: [DataType]!
    
    public init() {
        
    }
    
    open func getItemCount() -> Int {
        return self.items.count
    }
    
    open func getItem<T>(for index: Int) -> T {
        return self.items![index] as! T
    }
}
