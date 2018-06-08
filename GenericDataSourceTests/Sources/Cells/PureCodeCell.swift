//
//  PureCodeCell.swift
//  GenericDataSourceTests
//
//  Created by Jorge Luis on 08/06/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit
import GenericDataSourceSwift

class PureCodeCell: UITableViewCell, Setupable {
    weak var label: UILabel?
    
    var texts: [String] = []
    
    func setup(with data: [String]) {
        if self.label == nil {
            let newLabel = UILabel()
            self.contentView.addSubview(newLabel)
            self.label = newLabel
        }
        self.label?.text = "PureCodeCell: " + data.joined(separator: " - ")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label?.frame = self.contentView.bounds.insetBy(dx: 5, dy: 5)
    }
}
