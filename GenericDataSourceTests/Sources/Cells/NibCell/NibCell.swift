//
//  NibCell.swift
//  GenericDataSourceTests
//
//  Created by Jorge Luis on 08/06/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit
import GenericDataSourceSwift

class NibCell: UITableViewCell, Setupable {
    @IBOutlet weak var label: UILabel!
    
    func setup(with data: String) {
        self.label.text = data + data
    }
}
