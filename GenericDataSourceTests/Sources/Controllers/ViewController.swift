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

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate let dataSource = DataSource<String>()
    fileprivate lazy var tableViewDataSource = LinearDataSource(self.tableView, self.dataSource)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupItemsAndDataSource()
        self.tableView.reloadData()
    }
    
    fileprivate func setupItemsAndDataSource() {
        self.dataSource.items = [
            linearDataSourceTestName,
            linearDataSourceWithDifferentCellsTestName,
            arraySectionDataSourceTestName,
            dictionarySectionDataSourceTestName
        ]
        self.setupDataSource()
    }
    
    fileprivate func setupDataSource() {
        self.tableView.delegate = self
        self.tableView.dataSource = self.tableViewDataSource
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
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectItem(self.dataSource.getItem(for: indexPath))
    }
}

