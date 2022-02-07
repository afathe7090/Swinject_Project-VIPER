//
//  LoginRouter.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {
    
    weak var view: UIViewController?
    
    func build(){
        print("In Router Build")
    }
}
