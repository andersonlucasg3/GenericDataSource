//
//  ViewController.swift
//  GenericDataSourceTests
//
//  Created by Anderson Lucas de Castro Ramos on 22/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit
import GenericDataSource

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate let dataSource = DataSource<String>()
    fileprivate lazy var tableViewDataSource = LinearDataSource.init(self.tableView, self.dataSource)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupItemsAndDataSource()
        self.tableView.reloadData()
    }
    
    fileprivate func setupItemsAndDataSource() {
        self.dataSource.items = [
            "Linear DataSource",
            "Linear DataSource with Different Cells",
            "Array Section DataSource",
            "Dictionary Section DataSource"
        ]
        self.setupDataSource()
    }
    
    fileprivate func setupDataSource() {
        self.tableView.delegate = self
        self.tableView.dataSource = self.tableViewDataSource
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            
        }
    }
}

