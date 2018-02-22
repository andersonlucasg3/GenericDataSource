//
//  DataSource.swift
//  GenericDataSource
//
//  Created by Anderson Lucas de Castro Ramos on 20/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import Foundation

public protocol DataSourceProtocol {
    func getSectionCount() -> Int
    func getItemCount(for section: Int) -> Int
    func getItem<T>(for indexPath: IndexPath) -> T
}

open class DataSource<DataType>: DataSourceProtocol {
    public var items: [DataType]!
    
    open func getSectionCount() -> Int {
        return 1
    }
    
    open func getItemCount(for section: Int) -> Int {
        return self.items.count
    }
    
    open func getItem<T>(for indexPath: IndexPath) -> T {
        return self.items![indexPath.row] as! T
    }
}

open class ArraySectionDataSource<T> : DataSource<Array<T>> {
    open override func getSectionCount() -> Int {
        return self.items.count
    }
    
    open override func getItemCount(for section: Int) -> Int {
        return self.items[section].count
    }
    
    open override func getItem<T>(for indexPath: IndexPath) -> T {
        return self.items[indexPath.section][indexPath.row] as! T
    }
}

open class DictionarySectionDataSource<K: Hashable, T> : ArraySectionDataSource<Array<T>> {
    public var sections: Array<K>!
    
    open override func getSectionCount() -> Int {
        return self.sections.count
    }
    
    open override func getItemCount(for section: Int) -> Int {
        return self.items[section].count
    }
    
    open override func getItem<T>(for indexPath: IndexPath) -> T {
        return self.items[indexPath.section][indexPath.row] as! T
    }
}
