//
//  RegisterRouter.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import UIKit


class RegisterRouter : RegisterRouterProtocol{
 
    
    weak var viewController: UIViewController?
    
    
    func returnBackToLogin_From_Router() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
}
