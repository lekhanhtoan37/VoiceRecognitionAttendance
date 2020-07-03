//
//  ViewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/1/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit

struct User {
    
}
let API_Router = "https://backend-voice-recog.herokuapp.com/"

class MainViewController: BaseViewController {

    @IBOutlet weak var createRoomButton: UIButton!
    @IBOutlet weak var enterRoomButton: UIButton!
    
    var user: Students!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createRoomButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        enterRoomButton.addTarget(self, action: #selector(enterRoom), for: .touchUpInside)
        
    }

    @objc func createRoom() {
        // create Rooom
        // for teacher
        let checklistVC = ChecklistViewController.instantiate()
        push(vc: checklistVC)
        
    }

    @objc func enterRoom() {
        // enter room
        // for student
        if !user.isRecorded {
            let checkVC = RecordViewController.instantiate()
            push(vc: checkVC)
        }
        
    }

    func push(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

