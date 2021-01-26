//
//  CustomTextField.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import Foundation
import Foundation
import UIKit

protocol CustomTextFieldDelegate: class {
    func clickOnRightButton(textField: CustomTextField, _ sender: UIButton)
}

@IBDesignable
class CustomTextField: UITextField {
    
    //MARK: - Constants
    
    struct Metrics {

    }
    
    //MARK: - Properties
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    var button: UIButton = {
        let button = UIButton(type: .custom)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(rightButtonClicked), for: .touchUpInside)
        return button
    }()
    //MARK: - Delegates
    
    weak var customDelegate: CustomTextFieldDelegate?
    
    //MARK: - Overrided Functions

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
      return bounds.inset(by: padding)
    }
    
    //MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    //MARK: - Functions
    
    func commonInit() {
        addLine()
        self.backgroundColor = .clear
        self.textAlignment = .left
        self.font = .buildProjectFont(ofSize: 18, name: UIFont.FontNames.RobotoBlack)
        self.borderStyle = .none
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        
    }
    
    func configure(placeholder: String, placeholderColor: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
    }
    
    func addRightButtonToTextField(width: CGFloat, height: CGFloat, image: UIImage, tagLeftButton: Int?) {
        button.tag = tagLeftButton ?? 0
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: width, height: height)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @objc func rightButtonClicked() {
        customDelegate?.clickOnRightButton(textField: self, button)
    }
    
    func setSelectedLeftButton(isSelected: Bool) {
        button.isSelected = isSelected
    }
    
    func addLine(){
        let lineView = UIView(frame: .zero)
        lineView.backgroundColor = .white
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
    }
    
}
