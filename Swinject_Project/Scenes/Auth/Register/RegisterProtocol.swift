//
//  RegisterProtocol.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation



protocol RegisterViewProtocol: AnyObject {
    var presenter: RegisterPresenterProtocol! { get set }
}
protocol RegisterPresenterProtocol: AnyObject {
    var view: RegisterViewProtocol? { get set }
}

protocol RegisterRouterProtocol {
    
}

protocol RegisterInputInteractorProtocol: AnyObject {
    var presenter: RegisterOutputInteractorProtocol? { get set }
}

protocol RegisterOutputInteractorProtocol: AnyObject {
    
}
