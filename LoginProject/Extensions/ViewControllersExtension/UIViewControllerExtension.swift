//
//  UIViewControllerExtension.swift
//  LoginProject
//
//  Created by Mint on 1/8/21.
//

import Foundation
import UIKit

extension UIViewController{
    func popAlert (title: String, message: String, handler: ((UIAlertAction) -> Void)?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: handler)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        alertController.view.clipsToBounds = true
    }
}
