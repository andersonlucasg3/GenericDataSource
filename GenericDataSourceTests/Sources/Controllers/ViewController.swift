//
//  ViewController.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 22/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit
import GenericDataSourceSwift

let linearDataSourceTestName = "Linear DataSource"
let linearDataSourceWithDifferentCellsTestName = "Linear DataSource with Different Cells"
let arraySectionDataSourceTestName = "Array Section DataSource"
let dictionarySectionDataSourceTestName = "Dictionary Section DataSource"

class ViewController: UIViewController, GenericDelegateDataSourceProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var sections: [Section]!
    fileprivate lazy var tableViewDataSource = GenericDelegateDataSource(withSections: self.sections, andTableView: self.tableView, setupTable: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupItemsAndDataSource()
        self.tableView.reloadData()
    }
    
    fileprivate func setupItemsAndDataSource() {
        self.sections = self.createSections()
        self.setupDataSource()
    }
    
    fileprivate func createSections() -> [Section] {
        let dataSource = DataSource<String>([
            linearDataSourceTestName,
            linearDataSourceWithDifferentCellsTestName,
            arraySectionDataSourceTestName,
            dictionarySectionDataSourceTestName
        ])
        let datasource2 = DataSource<String>(Array(dataSource.items.reversed()))
        let datasource3 = DataSource<[String]>([dataSource.items,
                                                dataSource.items,
                                                dataSource.items])
        return [
            MySection(title: "Section 1", footer: "Footer 1", dataSource: dataSource),
            MySection(dataSource: datasource2),
            Section.init(cellType: PureCodeCell.self, title: "Section3", headerHeight: 20, dataSource: datasource3)
        ]
    }
    
    fileprivate func setupDataSource() {
        self.tableView.delegate = self.tableViewDataSource
        self.tableView.dataSource = self.tableViewDataSource
        self.tableViewDataSource.delegate = self
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        if self.sections[indexPath.section].itemTypeIs(type: String.self) {
            let item: String = self.sections[indexPath.section].getItem(for: indexPath.row)
            self.didSelectItem(item)
        }
    }
    
    fileprivate func didSelectItem(_ item: String) {
        switch item {
        case linearDataSourceTestName:
            // open view controller
            break
        case linearDataSourceWithDifferentCellsTestName:
            // open view controller
            break
        case arraySectionDataSourceTestName:
            // open view controller
            break
        case dictionarySectionDataSourceTestName:
            // open view controller
            break
        default: return
            //assertionFailure("Test View Controller Not Implemented For Item: \(item)")
        }
    }
    
    func commitEditingStyle(at indexPath: IndexPath, editingStyle style: UITableViewCellEditingStyle) {
        print("should \(style) for indexPath \(indexPath)")
    }
}

