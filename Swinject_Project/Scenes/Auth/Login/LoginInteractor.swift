//
//  LoginInteractor.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import RxCocoa
import RxSwift
import Swinject

class LoginInteractor: LoginInputInteractor{
    
    var presenter: LoginOutputInteractor?
    var authFirebase: FirebaseWorker!
    
    
    func signIn(email: BehaviorRelay<String>, password: BehaviorRelay<String>) async {
        let (_ ,error) = await authFirebase.signIn(email:email, password: password)
        
        if let error = error {
            // fail to sign in
            presenter?.failToLogin(error)
        }else{
            // succes To signin
            presenter?.successToLogin()
        }
        
    }
    
}
