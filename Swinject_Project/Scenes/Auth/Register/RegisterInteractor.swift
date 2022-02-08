//
//  RegisterInteractor.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import RxCocoa
import RxSwift

class RegisterInteractor: RegisterInPutInteractorProtocol {
    
    var presenter: RegisterOutputInteractorProtocol?
    
    var firebaseWorker: FirebaseWorker!
    
    
    func signIn(email: BehaviorRelay<String> , password: BehaviorRelay<String>) async {
       let (_ , error)  = await firebaseWorker.signUp(email: email, password: password)
        
        if let error = error {
            presenter?.failUserRegister(error)
        }else{
            presenter?.successUserRegister()
        }
    }
    
}
