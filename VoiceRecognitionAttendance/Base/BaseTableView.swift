//
//  BaseTableView.swift
//  TikFollower
//
//  Created by Le Toan on 6/15/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import UIKit

class BaseTableView<T: UITableViewCell>: BaseViewController, UITableViewDelegate, UITableViewDataSource {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return T()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
