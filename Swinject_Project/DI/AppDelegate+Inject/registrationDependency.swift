//
//  registrationDependency.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension Container {
    func regiserDependency(){
        loginDependanctInjection()
        registerViewDependancyInjection()
    }
}
