//
//  LoginView + Inject.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import Swinject

extension Container{
    
    func loginDependanctInjectionContainer(){

        register(LoginInteractor.self) { (resolver , presenter: LoginPresenter ) in
            let interactor = LoginInteractor()
            interactor.presenter = presenter
            interactor.authFirebase = resolver.resolve(FirebaseWorker.self)
            return interactor
        }
        
        register(LoginRouter.self) { (resolver , view: LoginViewController) in
            let router = LoginRouter()
            router.view = view
            return router
        }
        
        register(LoginPresenter.self) { (resolver , view: LoginViewController) in
            let presenter = LoginPresenter()
            presenter.view = view
            presenter.interactor = resolver.resolve(LoginInteractor.self, argument: presenter)
            presenter.router = resolver.resolve(LoginRouter.self, argument: view)
            return presenter
        }
        
        register(LoginViewController.self) { (resolver )in
            let loginViewController = LoginViewController()
            loginViewController.presenter = resolver.resolve(LoginPresenter.self, argument: loginViewController)
            return loginViewController
        }
    }
}
