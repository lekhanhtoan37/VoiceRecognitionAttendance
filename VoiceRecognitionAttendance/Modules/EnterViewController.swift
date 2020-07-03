//
//  EnterViewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/2/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit
import AZDialogView

class EnterViewController: BaseViewController {
    
    
    @IBOutlet weak var linkHostLabel: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var isF: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.navigationTitle.text = "Enter your room"
        confirmButton.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    @objc func action() {
        if linkHostLabel.text == "host12345" {
            let recordVC = RecorderViewController.instantiate()
            self.navigationController?.pushViewController(recordVC, animated: true)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                let dialog = AZDialogViewController(title: "Thong bao", message: "Khong tim thay phong")
                dialog.titleColor = .black
                dialog.addAction(AZDialogAction(title: "Xac nhan") { (dialog) -> (Void) in
                    //add your actions here.
                    dialog.dismiss()
                })
                
                dialog.show(in: self) { dialog in
                    
                    dialog.contentOffset = 0
                }
            }
        }
    }
}

