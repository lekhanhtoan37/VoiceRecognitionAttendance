//
//  RecordViewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/3/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit
import AVFoundation
import AZDialogView

class RecorderViewController: BaseViewController, RecordViewControllerDelegate {
    
    private var recordViewController: RecordViewController? {
        get {
            return children.compactMap({ $0 as? RecordViewController }).first
        }
    }
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var recordView: UIView!
    
    
    var arrayValue: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayValue = paperText1.split(separator: ".").map {
            $0.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        if let recorder = self.recordViewController {
            recorder.delegate = self
        }
        
        textView.text = getRandomString(input: arrayValue)
        
    }
    
    func getRandomString(input: [String]) -> String {
        guard input.count > 0 else {
            return ""
        }
        return input.randomElement()!
    }
}
extension RecorderViewController {
    func didStartRecording() {
        if let recorder = self.recordViewController {
            recorder.fadeView.isHidden = false
            UIView.animate(withDuration: 0.25, animations: {
                recorder.fadeView.alpha = 1
            })
        }
    }
    
    func didFinishRecording() {
        if let recorder = self.recordViewController {
            recorder.view.isUserInteractionEnabled = true
            UIView.animate(withDuration: 0.25, animations: {
                recorder.fadeView.alpha = 0
            }, completion: { (finished) in
                if finished {
                    recorder.fadeView.isHidden = true
                }
            })
            if recorder.identifyTime == 0 {
                //                // pop up da xac minh danh tinh
                let dialog = AZDialogViewController(title: "Thong bao", message: "Da xac minh thanh cong")
                dialog.titleColor = .black
                dialog.addAction(AZDialogAction(title: "Xac nhan") { (dialog) -> (Void) in
                    //add your actions here.
                    dialog.dismiss()
                    self.navigationController?.popViewController(animated: true)
                })

                dialog.show(in: self) { dialog in
                    
                    dialog.contentOffset = 0
                }
            }
            recorder.identifyTime -= 1
            textView.text = getRandomString(input: arrayValue)
        }
    }
    
}
