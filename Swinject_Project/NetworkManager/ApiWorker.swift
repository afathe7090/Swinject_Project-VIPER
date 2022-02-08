//
//  ApiWorker.swift
//  VIPER-RXSwift
//
//  Created by Ahmed Fathy on 04/02/2022.
//

import Foundation


class ApiWorker{
    
    var apiSerivice: ApiServicesType!
    
    
    func fetchNews(url: URL) async -> News?{
        return await apiSerivice.requestServireWith(News.self, url: url)
    }
    
    
    
    
}
