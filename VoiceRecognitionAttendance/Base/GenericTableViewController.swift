//
//  GenericTableViewController.swift
//  TikFollower
//
//  Created by Le Toan on 6/17/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import UIKit

open class GenericTableViewController<T, Cell: UITableViewCell>: UITableViewController {
    var items: [T]
    var configure: (Cell, T) -> Void
    var selectHandler: (T) -> Void
    
    init(items: [T], configure: @escaping (Cell, T) -> Void, selectHandler: @escaping (T) -> Void) {
        self.items = items
        self.configure = configure
        self.selectHandler = selectHandler
        super.init(style: .plain)
        self.tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
