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
    var registerVC: RegisterViewController?
    var homeVC: HomeViewController?
    
    func startWithRegisterView(){
        guard let registerVC = registerVC else { return }
        registerVC.modalPresentationStyle = .fullScreen
        view?.present(registerVC, animated: true, completion: nil)
    }
    
    func showHomeViewWhenSuccessToLogin(){
        guard let homeVC = homeVC else { return }
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.modalPresentationStyle = .fullScreen
        view?.present(homeNav, animated: true, completion: nil)
    }
    
}
