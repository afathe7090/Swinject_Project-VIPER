//
//  FirebaseWorker.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 30/01/2022.
//

import Firebase
import RxSwift
import RxCocoa

class FirebaseWorker{
    
    var authLayer: FirebaseAuth!
    
    func signIn(email: BehaviorRelay<String>, password: BehaviorRelay<String>) async ->(AuthDataResult? , Error?){
        return await authLayer.signIn(withEmail: email.value, password: password.value)
    }
    
    func signUp(email: BehaviorRelay<String> , password: BehaviorRelay<String>) async -> (AuthDataResult? , Error?) {
        return await authLayer.signUp(withEmail: email.value, password: password.value)
    }
}
