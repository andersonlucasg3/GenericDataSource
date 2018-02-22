//
//  CellProvider.swift
//  GenericDataSource
//
//  Created by Anderson Lucas de Castro Ramos on 20/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit.UITableView

public protocol CellProvider : class {
    func availableCellTypes() -> [UITableViewCell.Type]
    func cellType(for indexPath: IndexPath) -> UITableViewCell.Type
}
