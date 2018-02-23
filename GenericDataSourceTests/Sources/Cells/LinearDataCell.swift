//
//  LinearDataCell.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 22/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit
import GenericDataSource

class LinearDataCell: UITableViewCell, Setupable {
    typealias DataType = String
    
    func setup(with data: String) {
        self.textLabel?.text = data
    }
}
