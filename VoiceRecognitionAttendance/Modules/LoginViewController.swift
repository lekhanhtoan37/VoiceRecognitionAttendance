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
    var successCallback: ((TeacherModelResponse) -> Void)?
    var forcepushCallback: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isLeftButtonHidden = true
        navigationBar.navigationTitle.text = "Dang nhap"
        successCallback = { [weak self] data in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self?.push(model: data)
            }
        }
        forcepushCallback = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                let mainVC = MainViewController.instantiate()
                self?.navigationController?.pushViewController(mainVC, animated: true)
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
        
        let _body = TeacherModel(name: username, userid: password)
        guard let body = try? JSONEncoder().encode(_body) else {
            // pop up error
            return
        }
        urlRequest.httpBody = body
        let jsondecoder = JSONDecoder()
        URLSession.shared.dataTask(with: urlRequest) { (data, res , error) in
            guard error == nil else {
                print("got error")
                return
            }
            guard let statusCode = (res as? HTTPURLResponse)?.status else {
                
                return
            }
            
            switch statusCode.responseType {
            case .serverError:
                print("Loi server")
                self.forcepushCallback?()
            case .success:
                guard let data = data else { print("no data back")
                    return
                }
                do {
                    let result = try JSONDecoder().decode(TeacherModelResponse.self, from: data)
                    print(result)
                    self.successCallback?(result)
                } catch let error {
                    
                    if let decodingError = error as? DecodingError {
                        print(decodingError.metadata)
                    }
                    
                }
            default:
                print("Loi khi request")
                break
            }
        }.resume()
    }
    
    @objc
    func createTeacher(completion: @escaping () -> Void) {
        guard let username = usernamTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines), username != "" else {
            // pop up error
            return
        }
        guard let password = passwordTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines), password != ""  else {
            // pop up error
            return
        }
        
        let url = API_Router + "createTeacher"
        guard let urlObj = URL(string: url) else {return}
        var urlRequest = URLRequest(url: urlObj)
        
        urlRequest.httpMethod = HTTPMethod.post.rawValue
        //        urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        
        let _body = TeacherModel(name: username, userid: password)
        guard let body = try? JSONEncoder().encode(_body) else {
            // pop up error
            return
        }
        urlRequest.httpBody = body
        let jsondecoder = JSONDecoder()
        URLSession.shared.dataTask(with: urlRequest) { (data, res , error) in
            guard error == nil else {
                print("got error")
                return
            }
            guard let statusCode = (res as? HTTPURLResponse)?.status else {
                
                return
            }
            
            switch statusCode.responseType {
            case .serverError:
                print("Loi server")
                self.forcepushCallback?()
            case .success:
                guard let data = data else { print("no data back")
                    return
                }
                do {
                    let result = try JSONDecoder().decode(TeacherModelResponse.self, from: data)
                    print(result)
                    self.successCallback?(result)
                } catch let error {
                    
                    if let decodingError = error as? DecodingError {
                        print(decodingError.metadata)
                    }
                    
                }
            default:
                print("Loi khi request")
                break
            }
        }.resume()
    }
    
    
    func push(model: TeacherModelResponse) {
        let mainVC = MainViewController.instantiate()
        mainVC.user = Person(name: model.user.name, isHost: 0, clientId: model.user.clientID, trainFolder: model.user.trainFolder, testFolder: model.user.testFolder)
        
        navigationController?.pushViewController(mainVC, animated: true)
        
    }
    
}

struct TeacherModel: Codable {
    let name: String
    let userid: String
}

struct TeacherModelResponse: Codable {
    let user: User
}

// MARK: - User
struct User: Codable {
    let clientID: String
    let userid: String
    let name: String
    let isHost: Int
    let trainFolder: String
    let testFolder: String
    
    enum CodingKeys: String, CodingKey {
        case clientID = "client_id"
        case userid, name
        case isHost = "is_host"
        case trainFolder = "train_folder"
        case testFolder = "test_folder"
    }
}

