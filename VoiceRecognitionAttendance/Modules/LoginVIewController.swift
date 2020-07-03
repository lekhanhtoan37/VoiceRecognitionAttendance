//
//  LoginVIewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/2/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernamTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repasswordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(login(completion:)), for: .touchUpInside)
        signinButton.addTarget(self, action: #selector(signin(completion:)), for: .touchUpInside)
    }
    
    @objc
    func login(completion: @escaping () -> Void ) {
        let username = usernamTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
    
    @objc func signin(completion: @escaping () -> Void ) {
        let username = usernamTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let repassword = repasswordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func push() {
        let mainVC = MainViewController.instantiate()
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    
}
