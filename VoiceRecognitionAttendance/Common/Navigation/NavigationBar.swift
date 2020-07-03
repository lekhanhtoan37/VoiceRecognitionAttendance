//
//  NavigationBar.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/2/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit

class NavigationBar: UIView {
    
    @IBOutlet private var contentView: UIView!
    
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
//    @IBOutlet weak var rightLabel: UILabel!
    
    var isLeftButtonHidden: Bool {
      set {
         leftButton.isHidden = newValue
      }
      get {
         return leftButton.isHidden
      }
    }
     
    var isRightFirstButtonEnabled: Bool {
      set {
        rightButton.isEnabled = false
        rightButton.isHidden = true
      }
      get {
         return rightButton.isEnabled
      }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        navigationTitle.textColor = .white
    }
    
}

