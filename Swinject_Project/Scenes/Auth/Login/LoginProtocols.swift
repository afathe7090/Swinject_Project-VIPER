//
//  LoginProtocols.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import RxCocoa
import RxSwift

protocol LoginViewProtocol: AnyObject{
    var presenter: LoginPresenterProtocol! { get set}
    func showIndectorView(state: Bool)
    func changeStateOFLoginButton(state: Bool)
}

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? {get set}
    var emailBehavior: BehaviorRelay<String> { get set }
    var passwordBehavior: BehaviorRelay<String> { get set }
    func viewDidLoad()
    
    func goToRegisterView()
    func setLoginWithFirebase()
    
}

protocol LoginRouterProtocol{
    func startWithRegisterView()
}

protocol LoginInputInteractor: AnyObject {
    var presenter: LoginOutputInteractor? { get set}
    func signIn(email: BehaviorRelay<String>, password: BehaviorRelay<String>) async
    
}
protocol LoginOutputInteractor: AnyObject{
    func successToLogin()
    func failToLogin(_ error: Error)
}
