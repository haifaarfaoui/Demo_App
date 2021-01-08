//
//  UIColorExtension.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import Foundation
import UIKit

fileprivate class LoginProjectColors { }

extension UIColor{
    
    /// A color object whose hex value is #0D0D0D and whose alpha value is 1.0.
    public class var splashBlack: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "splash_black", in: Bundle(for: LoginProjectColors.self), compatibleWith: nil)!
        } else {
            return #colorLiteral(red: 0.05098039216, green: 0.05098039216, blue: 0.05098039216, alpha: 1)
        }
    }
    
    /// A color object whose hex value is #8D8D8D and whose alpha value is 1.0.
    public class var customGrey: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "grey", in: Bundle(for: LoginProjectColors.self), compatibleWith: nil)!
        } else {
            return #colorLiteral(red: 0.5529411765, green: 0.5529411765, blue: 0.5529411765, alpha: 1)
        }
    }
    
    /// A color object whose hex value is #D0021B and whose alpha value is 1.0.
    public class var red: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "red", in: Bundle(for: LoginProjectColors.self), compatibleWith: nil)!
        } else {
            return #colorLiteral(red: 0.8156862745, green: 0.007843137255, blue: 0.1058823529, alpha: 1)
        }
    }
    
}
