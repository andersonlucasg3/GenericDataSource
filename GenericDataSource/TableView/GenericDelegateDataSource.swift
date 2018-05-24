//
//  GenericDataSource.swift
//  GenericDataSource
//
//  Created by Helena Leitão on 16/02/2018.
//  Copyright © 2018 Teste. All rights reserved.
//

import UIKit

@objc public protocol GenericDelegateDataSourceProtocol: class {
    func didSelectItem(at indexPath: IndexPath)
    @objc optional func commitEditingStyle(at indexPath: IndexPath, editingStyle style: UITableViewCellEditingStyle)
}

open class GenericDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    fileprivate(set) weak var tableView: UITableView!
    
    public var sections: [SectionProtocol]!
    
    public weak var delegate: GenericDelegateDataSourceProtocol?
    
    public init(withSections sections: [SectionProtocol], andTableView tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.sections = sections
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
        section.cellPostConfiguration(for: cell, at: indexPath)
        return cell
    }
    
    open func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        let section = self.sections[indexPath.section]
        if self.delegate?.commitEditingStyle != nil {
            return section.editingStyle(for: tableView.cellForRow(at: indexPath)!, at: indexPath)
        }
        return .none
    }
    
    open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        self.delegate?.commitEditingStyle?(at: indexPath, editingStyle: editingStyle)
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectItem(at: indexPath)
    }
    
    // MARK: Header methods
    
    open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section].title
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.sections[section].headerHeight() ?? 0
    }
    
    open func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.sections[section].estimatedHeaderHeight() ?? self.tableView(tableView, heightForHeaderInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionModel = self.sections[section]
        guard let type = sectionModel.headerType() else { return nil }
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: type.reusableIdentifier)
        if let object = (sectionModel as! Section).headerObject {
            (header as? CellSetupable)?.configure(withAny: object)
            if let header = header {
                sectionModel.headerPostConfiguration(for: header, of: section)
            }
        }
        return header
    }
    
    // MARK: Footer methods
    
    open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return self.sections[section].footer
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.sections[section].footerHeight() ?? 0
    }
    
    open func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return self.sections[section].estimatedFooterHeight() ?? self.tableView(tableView, heightForFooterInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionModel = self.sections[section]
        guard let type = sectionModel.footerType() else { return nil }
        
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: type.reusableIdentifier)
        if let object = (sectionModel as! Section).footerObject {
            (footer as? CellSetupable)?.configure(withAny: object)
            if let footer = footer {
                sectionModel.footerPostConfiguration(for: footer, of: section)
            }
        }
        return footer
    }
}
