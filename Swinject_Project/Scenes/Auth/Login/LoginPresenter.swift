//
//  LoginPresenter.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol, LoginOutputInteractor {
    
    weak var view: LoginViewProtocol?
    var interactor: LoginInputInteractor?
    var router: LoginRouterProtocol?
    
    func viewDidLoad(){
        print("In ViewDidLoad Welcome TO Understanding")
    }
    

}
