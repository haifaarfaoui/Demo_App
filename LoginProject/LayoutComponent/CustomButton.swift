//
//  CustomButton.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import UIKit

class CustomButton: UIButton {
    
    //MARK: - Constants
    struct Metrics {
        static var cornerRaduis : CGFloat = 0.0
        static var textSize : CGFloat = 14
        static var borderWidth : CGFloat = 2
    }
    
    //MARK: - Properties
    var buttonHasBorders:Bool = false
    var buttonHasUperCasedTitle:Bool = false
    
    //MARK: -Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
  
    //MARK: - Functions
    
    ///This functions will take care of setting the font of the title, the alignment of the title and the corner radius
    func commonInit() {
        self.titleLabel?.font = .buildProjectFont(ofSize: Metrics.textSize, name: UIFont.FontNames.RobotoBlack)
        self.titleLabel?.textAlignment = .center
        self.layer.cornerRadius = Metrics.cornerRaduis
        self.backgroundColor = UIColor.clear
        self.setTitleColor(.white, for: .normal)
        self.clipsToBounds = true
    }
    
    ///This functions will take care of the custom configuration of the button
    func configureButton(title: String, backgroundColor: UIColor, titleColor: UIColor, borderColor: UIColor) {
        
        self.backgroundColor = backgroundColor
        setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        
        if buttonHasBorders == true {
            giveBorderToButton(borderColor: borderColor)
        }
        
        if buttonHasUperCasedTitle == true {
            makeTitleUperCased()
        }
    }
    
    func giveBorderToButton(borderColor: UIColor) {
        self.layer.borderWidth = Metrics.borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    

    
    func makeTitleUperCased() {
        self.setTitle(self.title(for: .normal)?.uppercased(), for: .normal)
    }
        
    /// Function that gives edge insets to the button title
    ///
    /// - Parameters:
    ///     - top: CGFloat
    ///     - left: CGFloat
    ///     - bottom: CGFloat
    ///     - right: CGFloat
    func addEdgeInsets(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.titleEdgeInsets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
