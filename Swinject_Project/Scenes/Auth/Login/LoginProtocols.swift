//
//  LoginProtocols.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation


protocol LoginViewProtocol: AnyObject{
    var presenter: LoginPresenterProtocol! { get set}
}

protocol LoginPresenterProtocol: AnyObject {
    var view: LoginViewProtocol? {get set}
    func viewDidLoad()
}

protocol LoginRouterProtocol{}

protocol LoginInputInteractor: AnyObject {
    var presenter: LoginOutputInteractor? { get set}
}
protocol LoginOutputInteractor: AnyObject{
}
