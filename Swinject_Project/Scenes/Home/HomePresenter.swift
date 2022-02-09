//
//  HomePresenter.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 09/02/2022.
//

import Foundation
import RxSwift
import RxCocoa


class HomePresenter: HomePresenterProtocol , HomeOutputInteractorProtocol{
    
     //MARK: - Observable
    
    private let newsSubject: PublishSubject<[Article]> = PublishSubject<[Article]>()
    
    var newsObservable: Observable<[Article]> {
        return newsSubject.asObserver()
    }
    
    
     //MARK: - Protocols
    weak var view: HomeViewProtocol?
    var interactor: HomeInputInteractorProtocol?
    var router: HomeRouterProtocol?
    
    
    

    
     //MARK: - ViewDidLoad
    
    func viewDidLoad(){
        print("In View DiDLaod Presnter")
        fetchNews()
    }
    
     //MARK: - Api States
    
    
    private func fetchNews(){
        Task{
            await interactor?.fetchNews()
        }
    }
    
    
    func successFetchNews(_ news: News) {
        guard let articles = news.articles else { return }
        newsSubject.onNext(articles)
    }
    
    func failToFetchNews() {
        print("Fail TO Get news")
    }
    
    
   
    
    
    
}
