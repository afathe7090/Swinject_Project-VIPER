//
//  APiWorker+Injection.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 08/02/2022.
//

import Swinject

extension Container{
    
    func apiWorkerDependencyInjectionContainer(){
        
        register(ApiServicesType.self) { _ in
            ApiServices()
        }
        
        register(ApiWorker.self) { resolver in
            let apiWorker = ApiWorker()
            apiWorker.apiSerivice = resolver.resolve(ApiServices.self)
            return apiWorker
        }
    }
}
