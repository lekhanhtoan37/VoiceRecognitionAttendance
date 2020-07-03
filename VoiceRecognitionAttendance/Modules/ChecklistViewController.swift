//
//  ChecklistViewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/1/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit

struct Students {
    let name: String
    let isAttending: Bool
    let clientId: String
    let isRecorded: Bool
}

struct Person {
    let name: String
    let isHost: Int
    let clientId: String
    let trainFolder: String
    let testFolder: String
}

class ChecklistViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var students: [Students] = []
    
    private var timeDelay: Double = 30
    var isF: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = 90
    
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChecklistCell
        cell.configUI(name: students[indexPath.row].name, isAttending: students[indexPath.row].isAttending)
        
        return cell
    }
    
    func timeUp(completion: (_ isDone: Bool) -> Void ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            // code
            // Request to check
        }
    }
    
}

class ChecklistCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusButton.isEnabled = false
        self.backgroundColor = .white
    }
    
    func configUI(name: String, isAttending: Bool) {
        nameLabel.text = name
        isAttending ? statusButton.setImage(#imageLiteral(resourceName: "icons8-ok"), for: .normal) : statusButton.setImage(#imageLiteral(resourceName: "icons8-cancel"), for: .normal)
    }
}
