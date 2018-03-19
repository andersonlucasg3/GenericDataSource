//
//  MySection.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 02/03/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import GenericDataSource

class MySection: Section {
    override func cellType(for index: Int) -> UITableViewCell.Type {
        return LinearDataCell.self
    }
    
    override func cellHeight(for index: Int) -> CGFloat {
        return 40
    }
    
    func headerHeight() -> CGFloat {
        return 20
    }
    
    func footerHeight() -> CGFloat {
        return self.footer != nil ? 40 : 0
    }
}
