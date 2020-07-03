//
//  BaseViewController.swift
//  TikFollower
//
//  Created by Le Toan on 6/15/20.
//  Copyright © 2020 Solarjsc. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol {
    
}

class BaseViewController: UIViewController, BaseViewControllerProtocol, StoryboardInstantiatable {
    static var storyboardName: AppStoryboard = .main

    lazy var navigationBar: NavigationBar = {
        let bar = NavigationBar()
        return bar
    }()
    
    var isHiddenNavigation: Bool {
        get {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        if !isHiddenNavigation {
            setupNavigation()
        }
        configAction()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func setupNavigation() {
        let _view = UIView()
        view.addSubview(navigationBar)
        view.addSubview(_view)
        
        _view.translatesAutoresizingMaskIntoConstraints = false
        _view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        _view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        _view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        _view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        _view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        navigationBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    
    func configAction() {
        navigationBar.leftButton.addTarget(self, action: #selector(back), for: .touchDown)
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}
