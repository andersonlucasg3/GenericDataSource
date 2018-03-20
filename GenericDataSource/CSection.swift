//
//  CSection.swift
//  GenericDataSourceTests
//
//  Created by Jorge Luis on 19/03/18.
//  Copyright © 2018 Teste. All rights reserved.
//


import UIKit


open class CSection : CSectionProtocol {
    fileprivate var dataSource: DataSourceProtocol
    
    public var title: String?
    public var footer: String?
    
    public var headerObject: Any?
    public var footerObject: Any?
    
    public init(title: String? = nil, footer: String? = nil, dataSource: DataSourceProtocol) {
        self.title = title
        self.footer = footer
        self.dataSource = dataSource
    }
    
    open func cellType(for index: Int) -> UITableViewCell.Type {
        return UITableViewCell.self
    }
    
    open func cellHeight(for index: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    open func estimatedCellHeight(for index: Int) -> CGFloat {
        return self.cellHeight(for: index)
    }
    
    public func itemCount() -> Int {
        return self.dataSource.getItemCount()
    }
    
    public func itemTypeIs(type: Any.Type) -> Bool {
        return self.dataSource.itemType() == type
    }
    
    public func getItem<T>(for index: Int) -> T {
        return self.dataSource.getItem(for: index)
    }
}

