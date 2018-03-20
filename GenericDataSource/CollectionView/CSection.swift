//
//  CSection.swift
//  GenericDataSourceTests
//
//  Created by Jorge Luis on 19/03/18.
//  Copyright © 2018 Teste. All rights reserved.
//


import UIKit


public protocol CSectionProtocol: class {
    //MARL:Required Methods
    func itemCount() -> Int
    func getItem<T>(for index: Int) -> T
    
    func cellType(for index: Int) -> UICollectionViewCell.Type
    func cellHeight(for index: Int) -> CGFloat
    func estimatedCellHeight(for index: Int) -> CGFloat
    
    
    //Optional Methods:
    func headerType() -> UICollectionReusableView.Type
    func headerHeight() -> CGFloat
    func estimatedHeaderHeight() -> CGFloat
    
    func footerType() -> UICollectionReusableView.Type
    func footerHeight() -> CGFloat
    func estimatedFooterHeight() -> CGFloat
    
}

extension CSectionProtocol {
    public func headerType() -> UICollectionReusableView.Type {
        return UICollectionReusableView.self
    }
    public func headerHeight() -> CGFloat {
        return 0
    }
    public func estimatedHeaderHeight() -> CGFloat {
        return 0
    }
    
    public func footerType() -> UICollectionReusableView.Type {
        return UICollectionReusableView.self
    }
    public func footerHeight() -> CGFloat {
        return 0
    }
    public func estimatedFooterHeight() -> CGFloat {
        return 0
    }
}

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
    
    public func cellType(for index: Int) -> UICollectionViewCell.Type {
        return UICollectionViewCell.self
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

