//
//  ViewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/1/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit

let API_Router = "https://backend-voice-recog.herokuapp.com/"

class MainViewController: BaseViewController {

    @IBOutlet weak var createRoomButton: UIButton!
    @IBOutlet weak var enterRoomButton: UIButton!
    
    var user: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.navigationTitle.text = "Man hinh chinh"
        navigationBar.navigationTitle.textColor = .white
        createRoomButton.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        enterRoomButton.addTarget(self, action: #selector(enterRoom), for: .touchUpInside)
        
    }

    @objc func createRoom() {
        // create Rooom
        // for teacher
        if user == nil {
            let checklistVC = ChecklistViewController.instantiate()
            checklistVC.isF = true
            push(vc: checklistVC)
        } else {
        
        if user.isHost == 0 {        
            let checklistVC = ChecklistViewController.instantiate()
            push(vc: checklistVC)
            }
            
        }
        
    }

    @objc func enterRoom() {
        // enter room
        // for student
        if user == nil {
            let enterVC = EnterViewController.instantiate()
            enterVC.isF = true
            push(vc: enterVC)
        } else {
        
        if user.isHost == 1 {
//            let checkVC = RecordViewController.instantiate()
            let enterVC = EnterViewController.instantiate()
            push(vc: enterVC)
        }
        }
    }
        

    func push(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

