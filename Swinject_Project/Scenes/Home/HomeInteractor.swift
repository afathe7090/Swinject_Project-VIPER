//
//  HomeInteractor.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 09/02/2022.
//

import Foundation
import RxCocoa
import RxSwift


class HomeInteractor: HomeInputInteractorProtocol {
    
    var presenter: HomeOutputInteractorProtocol?
    var apiWorker: ApiWorker?
    
    func fetchNews() async {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=f0b310a6e5f349838307ddd53bfa66c0&country=AR") else { return }
        let news  = await apiWorker?.fetchNews(url: url)
        
        if let news = news {
            // Success
            presenter?.successFetchNews(news)
        }else{
            // Fail
            presenter?.failToFetchNews()
        }
        
    }
    
}
