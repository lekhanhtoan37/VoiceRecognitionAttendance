//
//  LoginVIewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/2/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit
//import Alamofire

public enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}


class LoginViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernamTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var studentButton: UIButton!
    var successCallback: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        successCallback = {
            DispatchQueue.main.async {            
                self.push()
            }
        }
        
        loginButton.addTarget(self, action: #selector(createTeacher), for: .touchUpInside)
//        signinButton.addTarget(self, action: #selector(signin(completion:)), for: .touchUpInside)
        studentButton.addTarget(self, action: #selector(createStudent), for: .touchUpInside)
    }
    
    @objc
    func createStudent(completion: @escaping () -> Void) {
        guard let username = usernamTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines), username != "" else {
            // pop up error
            return
        }
        guard let password = passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines), password != "" else {
            // pop up error
            return
        }
        
        let url = API_Router + "createStudent"
        guard let urlObj = URL(string: url) else {return}
        var urlRequest = URLRequest(url: urlObj)

        urlRequest.httpMethod = HTTPMethod.post.rawValue
        urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        
        let _body = TeacherModel(name: username, userid: password)
        guard let body = try? JSONEncoder().encode(_body) else {
            // pop up error
            print("error")
            return
        }
        urlRequest.httpBody = body
        let task = URLSession.shared.dataTask(with: urlObj) { (data, response, error) in
            guard error == nil else {return}
            guard let data = data else { return }
            self.successCallback?()
        }
        task.resume()
    }
    
    @objc
    func createTeacher(completion: @escaping () -> Void) {
        guard let username = usernamTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            // pop up error
            return
        }
        guard let password = passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {
            // pop up error
            return
        }
        
        let url = API_Router + "createTeacher"
        guard let urlObj = URL(string: url) else {return}
        var urlRequest = URLRequest(url: urlObj)

        urlRequest.httpMethod = HTTPMethod.post.rawValue
        urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        
        let _body = TeacherModel(name: username, userid: password)
        guard let body = try? JSONEncoder().encode(_body) else {
            // pop up error
            return
        }
        urlRequest.httpBody = body
        let task = URLSession.shared.dataTask(with: urlObj) { (data, response, error) in
            guard error == nil else {return}
            guard let data = data else { return }
            self.successCallback?()
        }
        task.resume()
    }
    
 
    func push() {
        let mainVC = MainViewController.instantiate()
        navigationController?.pushViewController(mainVC, animated: true)
        
    }
    
    
}

struct TeacherModel: Codable {
    let name: String
    let userid: String
}
