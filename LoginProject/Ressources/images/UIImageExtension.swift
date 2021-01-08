//
//  UIImageExtension.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import Foundation
import UIKit

fileprivate class LoginProjectImage { }

extension UIImage {
    
    public class var icSplashLogo: UIImage {
        return UIImage(named: "ic_splash_logo", in: Bundle(for: LoginProjectImage.self), compatibleWith: nil)!
    }
    
    public class var icLoginBckgd: UIImage {
        return UIImage(named: "ic_login_bckgd", in: Bundle(for: LoginProjectImage.self), compatibleWith: nil)!
    }
    
    public class var icLoginLogo: UIImage {
        return UIImage(named: "ic_login_logo", in: Bundle(for: LoginProjectImage.self), compatibleWith: nil)!
    }
    
    public class var icErrorIndicatoe: UIImage {
        return UIImage(named: "ic_error", in: Bundle(for: LoginProjectImage.self), compatibleWith: nil)!
    }
    
    public class var icPasswordEye: UIImage {
        return UIImage(named: "ic_password_eye", in: Bundle(for: LoginProjectImage.self), compatibleWith: nil)!
    }
    
}
