//
//  LoginInteractor.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import RxSwift

class LoginInteractor: LoginInputInteractor{
    var presenter: LoginOutputInteractor?
    
    private let authFirebase = container.resolve(FirebaseWorker.self)
    
    
}
