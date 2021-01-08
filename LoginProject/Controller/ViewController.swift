//
//  ViewController.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Properties
    let splashView: SplashView = {
        let view : SplashView = SplashView()
        return view
    }()
    
    let loginView: LoginView = {
        let view : LoginView = LoginView()
        return view
    }()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fadeToLogin()
        // Do any additional setup after loading the view.
    }


    override func loadView(){
        super.loadView()
    }
    
    func showSplash(){
        view.addSubview(splashView)
        splashView.alpha = 1.0
        NSLayoutConstraint.activate([
            splashView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashView.topAnchor.constraint(equalTo: view.topAnchor),
            splashView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func showLogin(){
        view.addSubview(loginView)
        loginView.alpha = 0.0
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fadeToLogin(){
        showSplash()
        showLogin()
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 3.0, animations:{
                self.splashView.alpha = 0.0
                self.loginView.alpha = 1.0
                self.view.layoutIfNeeded()
            })
        }
    }
    
}

