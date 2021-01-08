//
//  UIFontExtension.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import Foundation
import UIKit

fileprivate class ProjectFonts { }

extension UIFont{
    
    ///Add the font names here as they are named
    class FontNames {
        static let RobotoBold = "Roboto-Bold"
        static let RobotoBoldItalic = "Roboto-BoldItalic"
        static let RobotoItalic = "Roboto-Italic"
        static let RobotoLightItalic = "Roboto-LightItalic"
        static let RobotoRegular = "Roboto-Regular"
        static let RobotoMedium = "Roboto-Medium"
        static let RobotoLight = "Roboto-Light"
        static let RobotoBlack = "Roboto-Black"
        static let RobotoBlackItalic = "Roboto-BlackItalic"
    }

    /// Static function that creates a Project Font
    ///
    /// - Parameters:
    ///     - fontSize: Font size
    ///     - name: Font name
    /// - Returns: Project Font with specified parameters
    class func buildProjectFont(ofSize fontSize: CGFloat, name: String) -> UIFont {
        guard let projectFont = UIFont(name: name, size: fontSize) else{
            return UIFont.systemFont(ofSize: fontSize)
        }
        return projectFont
    }
    
}
