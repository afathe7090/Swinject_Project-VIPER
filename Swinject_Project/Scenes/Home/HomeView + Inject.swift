//
//  HomeView + Injection.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 09/02/2022.
//

import Foundation
import Swinject

extension Container {
    
    func homeViewDependencyInjectionContainer(){
        
        register(HomeInteractor.self) { (resolver , presenter: HomePresenter) in
            let interactor = HomeInteractor()
            interactor.presenter = presenter
            interactor.apiWorker = resolver.resolve(ApiWorker.self)
            return interactor
        }
        
        
        register(HomePresenter.self) { (resolver, view: HomeViewController) in
            let presenter = HomePresenter()
            presenter.view = view
            presenter.router = resolver.resolve(HomeRouter.self, argument: view)
            presenter.interactor = resolver.resolve(HomeInteractor.self, argument: presenter)
            return presenter
        }
        
       register(HomeRouter.self) { (resolver, view: HomeViewController) in
            let router = HomeRouter()
            router.viewController = view
            return router
        }
        
        register(HomeViewController.self) { resolver in
            let homeVC = HomeViewController()
            homeVC.presenter = resolver.resolve(HomePresenter.self,argument: homeVC)
            return homeVC
        }
        
    }
    
}
