//
//  registrationDependency.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import Swinject

extension Container {
    func regiserDependency(){
        // modules of scenes inject
        loginDependanctInjectionContainer()
        registerViewDependancyInjectionContainer()
        
        // api and firebase inject models
        firebaseDependencyInjectionContainer()
        apiWorkerDependencyInjectionContainer()
    }
}
