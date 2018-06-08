//
//  MySection.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 02/03/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import GenericDataSourceSwift

class MySection: Section {        
    
    override func allCellTypes() -> [UITableViewCell.Type] {
        return [LinearDataCell.self, NibCell.self]
    }
    
    override func cellType(for index: Int) -> UITableViewCell.Type {
        return index % 2 == 0 ? NibCell.self : LinearDataCell.self
    }
    
    override func cellHeight(for index: Int) -> CGFloat {
        if index % 2 == 0 {
            return UITableViewAutomaticDimension
        } else {
            return self.title == "Section 1" ? 40 : 80
        }
        
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
    
    override func didSetDatasource() {
        if let datasource = self.dataSource as? DataSource<String> {
            for (offset,_) in datasource.items.enumerated() where offset % 2 == 0 {
                datasource.items[offset] = datasource.items.joined(separator: " ")
            }
        }
    }
}
