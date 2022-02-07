//
//  RegiseterPresenter.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation

class RegiseterPresenter: RegisterPresenterProtocol, RegisterOutputInteractorProtocol{
    var view: RegisterViewProtocol?
    var interactor: RegisterInputInteractorProtocol?
    var router: RegisterRouterProtocol?
}
