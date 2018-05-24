//
//  Section.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 01/03/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit

public protocol SectionProtocol: class {
    var title: String? { get set }
    var footer: String? { get set }
    
    func headerType() -> UITableViewHeaderFooterView.Type?
    func headerHeight() -> CGFloat?
    func estimatedHeaderHeight() -> CGFloat?
    func headerPostConfiguration(for header: UITableViewHeaderFooterView, of section: Int)
    
    func footerType() -> UITableViewHeaderFooterView.Type?
    func footerHeight() -> CGFloat?
    func estimatedFooterHeight() -> CGFloat?
    func footerPostConfiguration(for footer: UITableViewHeaderFooterView, of section: Int)
 
    func itemCount() -> Int
    
    func cellType(for index: Int) -> UITableViewCell.Type
    func cellHeight(for index: Int) -> CGFloat
    func estimatedCellHeight(for index: Int) -> CGFloat
    func cellPostConfiguration(for cell: UITableViewCell, at indexPath: IndexPath)
    func editingStyle(for cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCellEditingStyle
}

open class Section : SectionProtocol {
    fileprivate var dataSource: DataSourceProtocol
    
    public var title: String?
    public var footer: String?
    
    public var headerObject: Any?
    public var footerObject: Any?
    
    public required init(title: String? = nil, footer: String? = nil, dataSource: DataSourceProtocol) {
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
    
    open func editingStyle(for cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    open func itemCount() -> Int {
        return self.dataSource.getItemCount()
    }
    
    open func itemTypeIs(type: Any.Type) -> Bool {
        return self.dataSource.itemType() == type
    }
    
    open func getItem<T>(for index: Int) -> T {
        return self.dataSource.getItem(for: index)
    }
    
    open func headerType() -> UITableViewHeaderFooterView.Type? {
        return nil
    }
    
    open func headerHeight() -> CGFloat? {
        return nil
    }
    
    open func estimatedHeaderHeight() -> CGFloat? {
        return nil
    }
    
    open func footerType() -> UITableViewHeaderFooterView.Type? {
        return nil
    }
    
    open func footerHeight() -> CGFloat? {
        return nil
    }
    
    open func estimatedFooterHeight() -> CGFloat? {
        return nil
    }
    
    open func footerPostConfiguration(for footer: UITableViewHeaderFooterView, of section: Int) {
        
    }
    
    open func cellPostConfiguration(for cell: UITableViewCell, at indexPath: IndexPath) {
        
    }
    
    open func headerPostConfiguration(for header: UITableViewHeaderFooterView, of section: Int) {
        
    }
}
