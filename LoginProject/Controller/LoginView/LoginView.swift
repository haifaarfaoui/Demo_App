//
//  LoginView.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import UIKit

class LoginView: UIView {
    
    struct Metrics{
        static let btnHeight : CGFloat = 12.5
        static let btnWidth : CGFloat = 18
        
        static let topEdge : CGFloat = 37
        static let leadingEdge : CGFloat = 30
        
        static let logoWidth : CGFloat = 50
        static let logoBottomEdge : CGFloat = 52
        static let welcomeBottomEdge: CGFloat = 25
        
        static let textFieldHeight : CGFloat = 48
        
        static let textFieldBottomEdge : CGFloat = 12
        static let loginBtnHeight : CGFloat = 46
    }
    
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
    let bckgrndImgView : UIImageView = {
        let bckgrnd : UIImageView = UIImageView(frame: .zero)
        bckgrnd.translatesAutoresizingMaskIntoConstraints = false
        bckgrnd.image = .icLoginBckgd
        return bckgrnd
    }()
    
    let loginLogo: UIImageView = {
        let logo : UIImageView = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = .icLoginLogo
        return logo
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setText(NSLocalizedString("welcome", comment: ""))
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let txtfEmail: CustomTextFieldWithErroLabel = {
        let txtfEmail : CustomTextFieldWithErroLabel = CustomTextFieldWithErroLabel()
        txtfEmail.translatesAutoresizingMaskIntoConstraints = false
        txtfEmail.configureTextField(placeholder: NSLocalizedString("email_placeholder", comment: ""), placeholderColor: .customGrey)
        return txtfEmail
    }()
    
    let txtfPassword: CustomTextFieldWithErroLabel = {
        let txtfPassword : CustomTextFieldWithErroLabel = CustomTextFieldWithErroLabel()
        txtfPassword.translatesAutoresizingMaskIntoConstraints = false
        txtfPassword.configureTextField(placeholder: NSLocalizedString("password_placeholder", comment: ""), placeholderColor: .customGrey, width: Metrics.btnWidth, height: Metrics.btnHeight, image: .icPasswordEye, tagLeftButton: 0)
        txtfPassword.textField.textContentType = .password
        txtfPassword.textField.isSecureTextEntry = true
        return txtfPassword
    }()
    
    let loginBtn : CustomButton = {
        let btn : CustomButton = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.buttonHasBorders = true
        btn.configureButton(title: NSLocalizedString("login_btn_title", comment: ""), backgroundColor: .clear, titleColor: UIColor.customGrey, borderColor: UIColor.customGrey)
        return btn
    }()
    
    
    //MARK: - Functions
    func commonInit() {
        constraintUI()
    }
    func constraintUI(){
        backgroundColor = .clear
        self.addSubview(bckgrndImgView)
        addSubview(loginLogo)
        addSubview(welcomeLabel)
        addSubview(txtfEmail)
        addSubview(txtfPassword)
        addSubview(loginBtn)
        sendSubviewToBack(bckgrndImgView)
        NSLayoutConstraint.activate([
            
            bckgrndImgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bckgrndImgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bckgrndImgView.topAnchor.constraint(equalTo: topAnchor),
            bckgrndImgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            loginLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginLogo.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.topEdge),
            
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.leadingEdge),
            welcomeLabel.topAnchor.constraint(equalTo: loginLogo.bottomAnchor, constant: Metrics.logoBottomEdge),
            
            txtfEmail.centerXAnchor.constraint(equalTo: centerXAnchor),
            txtfEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.leadingEdge),
            txtfEmail.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.welcomeBottomEdge),
            txtfEmail.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight),
            
            txtfPassword.centerXAnchor.constraint(equalTo: centerXAnchor),
            txtfPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.leadingEdge),
            txtfPassword.topAnchor.constraint(equalTo: txtfEmail.bottomAnchor, constant: Metrics.textFieldBottomEdge),
            txtfPassword.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight),

            loginBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.leadingEdge),
            loginBtn.topAnchor.constraint(equalTo: txtfPassword.bottomAnchor, constant: Metrics.textFieldBottomEdge),
            loginBtn.heightAnchor.constraint(equalToConstant: Metrics.loginBtnHeight)

        ])
    }
}
