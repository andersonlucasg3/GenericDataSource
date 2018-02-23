//
//  GenericDataSource.swift
//  GenericDataSource
//
//  Created by Helena Leitão on 16/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit

open class GenericDataSource: NSObject, UITableViewDataSource {
    fileprivate(set) weak var tableView: UITableView!
    
    public var dataSource: DataSourceProtocol!
    
    fileprivate(set) var cellProvider: CellProvider! {
        didSet {
            self.registerCells()
        }
    }
    
    public init(withProvider cellProvider: CellProvider, dataSource: DataSourceProtocol, andTableView tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.cellProvider = cellProvider
        self.dataSource = dataSource
    }
    
    fileprivate func registerCells() {
        self.cellProvider.availableCellTypes().forEach { [weak self] (type) in
            self?.tableView.register(type, forCellReuseIdentifier: type.reusableIdentifier)
        }
    }
    
    // MARK: UITableViewDataSource
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.getSectionCount()
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.getItemCount(for: section)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = self.cellProvider.cellType(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: type.reusableIdentifier, for: indexPath)
        let item: Any = self.dataSource.getItem(for: indexPath)
        (cell as! CellSetupable).configure(withAny: item)
        return cell
    }
}
