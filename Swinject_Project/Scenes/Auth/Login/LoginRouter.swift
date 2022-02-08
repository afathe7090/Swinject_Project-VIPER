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
    
    func startWithRegisterView(){
        guard let registerVC = container.resolve(RegisterViewController.self) else { return }
        registerVC.modalPresentationStyle = .fullScreen
        view?.present(registerVC, animated: true, completion: nil)
    }
}
