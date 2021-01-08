//
//  CustomTextFieldWithErroLabel.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import Foundation
import Foundation
import UIKit

protocol CustomTextFieldWithErroLabelDelegate: class {
    func clickRightButtonTextfield(view: CustomTextFieldWithErroLabel, textField: CustomTextField, _ sender: UIButton)
}

@IBDesignable
class CustomTextFieldWithErroLabel: UIView {
    
    //MARK: - Constants
    
    struct Metrics {
        static let numberOferroLines: Int = 1
        static let textFieldHeight: CGFloat = 50
        static let errorLabelTopAnchor: CGFloat = 1
        static let cornerRadius: CGFloat = 4
    }
    
    //MARK: - Properties
    
    var iconClick = true
    var isDataVAlid = false
    
    //MARK: - delegate
    
    weak var delegate: CustomTextFieldWithErroLabelDelegate?
    
    //MARK: - Outlets
    
    var textField: CustomTextField = {
        let textField = CustomTextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var errorLabel: UILabel = {
        let errorLabel = UILabel(frame: .zero)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.apply(fontOfText: UIFont(), with: .red)
        errorLabel.textAlignment = .left
        errorLabel.numberOfLines = Metrics.numberOferroLines
        return errorLabel
    }()
    
    //MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        constraintUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        constraintUI()
    }
    
    //MARK: - Constraints
    
    func constraintUI() {
        
        textField.customDelegate = self
        self.layer.cornerRadius = Metrics.cornerRadius
        self.backgroundColor = .lightGray
        self.addSubview(textField)
        self.addSubview(errorLabel)
    
        NSLayoutConstraint.activate([
            
            ///TextField constraints
            textField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textField.topAnchor.constraint(equalTo: self.topAnchor),
            textField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: Metrics.textFieldHeight),
            
            ///Error label constraints
            errorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            errorLabel.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: Metrics.errorLabelTopAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    //MARK: - Functions
    
    /// Configure textfield with placeholder
    func configureTextField(placeholder: String, placeholderColor: UIColor) {
        textField.configure(placeholder: placeholder, placeholderColor: placeholderColor)
    }
    
    /// Configure textfield with placeholder and keyboard type
    func configureTextField(placeholder: String, placeholderColor: UIColor, keyboardType: UIKeyboardType) {
        textField.configure(placeholder: placeholder, placeholderColor: placeholderColor)
        textField.keyboardType = keyboardType
    }
    
    /// Configure textfield with placeholder and left button
    func configureTextField(placeholder: String, placeholderColor: UIColor, width: CGFloat, height: CGFloat, image: UIImage, tagLeftButton: Int?) {
        textField.configure(placeholder: placeholder, placeholderColor: placeholderColor)
        textField.addRightButtonToTextField(width: width, height: height, image: image, tagLeftButton: tagLeftButton)
    }
    
    /// Configure textfield with placeholder, left button and keyboard type
    func configureTextField(placeholder: String, placeholderColor: UIColor, width: CGFloat, height: CGFloat, image: UIImage, tagLeftButton: Int?, keyboardType: UIKeyboardType) {
        textField.keyboardType = keyboardType
        textField.configure(placeholder: placeholder, placeholderColor: placeholderColor)
        textField.addRightButtonToTextField(width: width, height: height, image: image, tagLeftButton: tagLeftButton)
    }
    
    /// show a bottom error label in case of error
    func showError(errorMessage: String) {
        errorLabel.text = errorMessage
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
    }
    
    /// hide the error label
    func hideError() {
        errorLabel.text = ""
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
    
    /// get textfield content
    func getText() -> String {
        guard let text = textField.text else { return "" }
        return text
    }
    
    /// set textfield content
    func setText(text: String) {
        textField.text = text
    }
    
    /// clear textfield content
    func clearText() {
        textField.text = ""
    }
    
    func clickLeftButton(_ sender: UIButton) {
        if(self.iconClick == true) {
            textField.isSecureTextEntry = false
//            sender.setImage(.icPswrdShow, for: .normal)
        } else {
//            sender.setImage(.icPswrdHide, for: .normal)
            textField.isSecureTextEntry = true
        }

        self.iconClick = !self.iconClick
    }
    
    /// Validate textfield base on validator error
    func validatedText(validatorError: ValidationError) -> Bool {

        switch validatorError.error {
        case true:
            showError(errorMessage: validatorError.message)
            return true
        case false:
            hideError()
            return false
        }
    }
    
    /// set left button selection
    func setSelectionLeftButton(isSelected: Bool) {
        textField.setSelectedLeftButton(isSelected: isSelected)
    }
    
    ///enable and disable textfield
    func isEnabled(status: Bool) {
        textField.isEnabled = status
    }
    
}

extension CustomTextFieldWithErroLabel : CustomTextFieldDelegate {
    
    func clickOnRightButton(textField: CustomTextField, _ sender: UIButton) {
        delegate?.clickRightButtonTextfield(view: self, textField: textField, sender)
    }

}
