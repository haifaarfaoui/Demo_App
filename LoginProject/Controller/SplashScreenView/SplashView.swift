//
//  SplashView.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import UIKit

class SplashView: UIView {
    
    //MARK: -Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.commonInit()
    }
    
    //MARK: - Properties
    let splashLogo : UIImageView = {
        let splashLogo : UIImageView = UIImageView(frame: .zero)
        splashLogo.translatesAutoresizingMaskIntoConstraints = false
        splashLogo.image = .icSplashLogo
        return splashLogo
    }()
    
    //MARK: - Functions
    func commonInit() {
        constraintUI()
    }
    func constraintUI(){
        backgroundColor = .splashBlack
        self.addSubview(splashLogo)
        NSLayoutConstraint.activate([
            splashLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            splashLogo.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
