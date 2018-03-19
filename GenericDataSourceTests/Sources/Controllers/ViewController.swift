//
//  ViewController.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 22/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit
import GenericDataSource

let linearDataSourceTestName = "Linear DataSource"
let linearDataSourceWithDifferentCellsTestName = "Linear DataSource with Different Cells"
let arraySectionDataSourceTestName = "Array Section DataSource"
let dictionarySectionDataSourceTestName = "Dictionary Section DataSource"

class ViewController: UIViewController, GenericDelegateDataSourceProtocol {
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var sections: [Section]!
    fileprivate lazy var tableViewDataSource = GenericDelegateDataSource(withSections: self.sections, andTableView: self.tableView)
    
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
        let dataSource = DataSource<String>()
        dataSource.items = [
            linearDataSourceTestName,
            linearDataSourceWithDifferentCellsTestName,
            arraySectionDataSourceTestName,
            dictionarySectionDataSourceTestName
        ]
        return [
            MySection(title: "Section 1", dataSource: dataSource),
            MySection(title: "Section 2", footer: "Footer 2", dataSource: dataSource)
        ]
    }
    
    fileprivate func setupDataSource() {
        self.tableView.delegate = self.tableViewDataSource
        self.tableView.dataSource = self.tableViewDataSource
        self.tableViewDataSource.delegate = self
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let item: String = self.sections[indexPath.section].getItem(for: indexPath.row)
        self.didSelectItem(item)
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
        default:
            assertionFailure("Test View Controller Not Implemented For Item: \(item)")
        }
    }
}

