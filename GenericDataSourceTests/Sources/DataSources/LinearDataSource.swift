//
//  LinearDataSource.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 22/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import GenericDataSource

class LinearDataSource: GenericDataSource, CellProvider {
    init(_ tableView: UITableView, _ dataSource: DataSource<String>) {
        super.init(withProvider: self, andTableView: tableView)
    }
    
    // MARK: CellProvider
    
    func availableCellTypes() -> [UITableViewCell.Type] {
        return [LinearDataCell.self]
    }
    
    func cellType(for indexPath: IndexPath) -> UITableViewCell.Type {
        return LinearDataCell.self
    }
}
