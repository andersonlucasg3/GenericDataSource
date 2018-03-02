//
//  GenericDataSource.swift
//  GenericDataSource
//
//  Created by Helena Leitão on 16/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit

open class GenericDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    fileprivate(set) weak var tableView: UITableView!
    
    public var sections: [SectionProtocol]!
    
    public init(withSections sections: [SectionProtocol], andTableView tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.sections = sections
        self.registerCells()
    }
    
    fileprivate func registerCells() {
        let set = NSMutableSet()
        self.sections.forEach({
            for i in 0..<$0.itemCount() {
                set.add($0.cellType(for: i))
            }
        })
        set.allObjects.map({$0 as! UITableViewCell.Type}).forEach({ [weak self] (item: UITableViewCell.Type) in
            self?.tableView.register(item, forCellReuseIdentifier: item.reusableIdentifier)
        })
    }
    
    // MARK: UITableViewDataSource
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].itemCount()
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = self.sections[indexPath.section]
        let type = section.cellType(for: row)
        let item: Any = (section as! Section).getItem(for: row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: type.reusableIdentifier, for: indexPath)
        (cell as! CellSetupable).configure(withAny: item)
        return cell
    }
    
    // MARK: Header methods
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.sections[section].headerHeight?() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.sections[section].estimatedHeaderHeight?() ?? self.tableView(tableView, heightForHeaderInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let section = self.sections[section]
        guard let type = section.headerType?() else { return nil }
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: type.reusableIdentifier)
        if let object = (section as! Section).headerObject {
            (header as? CellSetupable)?.configure(withAny: object)
        }
        return header
    }
    
    // MARK: Footer methods
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footer
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.sections[section].footerHeight?() ?? 0
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return self.sections[section].estimatedFooterHeight?() ?? self.tableView(tableView, heightForFooterInSection: section)
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let section = self.sections[section]
        guard let type = section.footerType?() else { return nil }
        
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: type.reusableIdentifier)
        if let object = (section as! Section).footerObject {
            (footer as? CellSetupable)?.configure(withAny: object)
        }
        return footer
    }
}
