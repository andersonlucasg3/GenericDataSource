//
//  MySection.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 02/03/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import GenericDataSourceSwift

class MySection: Section {
    override func cellType(for index: Int) -> UITableViewCell.Type {
        return LinearDataCell.self
    }
    
    override func cellHeight(for index: Int) -> CGFloat {
        return self.title == "Section 1" ? 40 : 80
    }
    
    override func headerHeight() -> CGFloat? {
        return 20
    }
    
    override func footerHeight() -> CGFloat? {
        return self.footer != nil ? 40 : 0
    }
    
    override func editingStyle(for cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
}
