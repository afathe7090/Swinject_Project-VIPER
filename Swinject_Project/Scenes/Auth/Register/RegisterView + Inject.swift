//
//  RegisterView + Inject.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Swinject
import UIKit

extension Container{
    
    func registerViewDependancyInjection(){
        
        register(RegisterRouter.self) { (r, viewController: RegisterViewController) in
            let router = RegisterRouter()
            router.viewController = viewController
            return router
        }
        
        register(RegisterInteractor.self) { (resolver, presenter: RegisterOutputInteractorProtocol) in
            let interactor = RegisterInteractor()
            interactor.presenter = presenter
            return interactor
        }
        
        register(RegiseterPresenter.self) { (resolver, view: RegisterViewController) in
            let presenter = RegiseterPresenter()
            presenter.view = view
            presenter.interactor = resolver.resolve(RegisterInteractor.self, argument: presenter)
            presenter.router = resolver.resolve(RegisterRouter.self, argument: view)
            return presenter
        }
        
        register(RegisterViewController.self) { (resolver) in
            let view = RegisterViewController()
            view.presenter = resolver.resolve(RegiseterPresenter.self, argument: view)
            return view
        }
        
    }
    
}
