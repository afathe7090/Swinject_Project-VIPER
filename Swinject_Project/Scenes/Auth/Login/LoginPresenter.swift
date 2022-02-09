//
//  LoginPresenter.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import Foundation
import Swinject
import RxCocoa
import RxSwift

class LoginPresenter: LoginPresenterProtocol, LoginOutputInteractor {
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Observer
    //----------------------------------------------------------------------------------------------------------------
    
    var emailBehavior: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var passwordBehavior: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoadingBehavior: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)

    private let bag = DisposeBag()
    
    //----------------------------------------------------------------------------------------------------------------
    //=======>MARK: -  Protocols
    //----------------------------------------------------------------------------------------------------------------
    weak var view: LoginViewProtocol?
    var interactor: LoginInputInteractor?
    var router: LoginRouterProtocol?
    
    
    
    
    func viewDidLoad(){
        Task{
            await startBindingForIndectator()
            await changeStateForUI()
        }
    }
    
    func setLoginWithFirebase(){
        isLoadingBehavior.accept(true)
        Task{
            await interactor?.signIn(email: emailBehavior, password: passwordBehavior)
        }
    }
    
    
}

//----------------------------------------------------------------------------------------------------------------
//=======>MARK: - Extension
//----------------------------------------------------------------------------------------------------------------

extension LoginPresenter{
    
    func successToLogin() {
        // go to home page and stop loading
        print("Success To login")
        DispatchQueue.main.async {
            self.isLoadingBehavior.accept(false)
            self.router?.showHomeViewWhenSuccessToLogin()
        }
    }
    
    func failToLogin(_ error: Error) {
        // stop loading and show error
        isLoadingBehavior.accept(false)
        print(error.localizedDescription)
    }
    
    
    func startBindingForIndectator() async {
        isLoadingBehavior
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {[weak self ] state in
            guard let self = self else { return }
            self.view?.showIndectorView(state: state)
        }).disposed(by: bag)
    }
    
    
    func changeStateForUI() async{
        Observable.combineLatest(emailBehavior, passwordBehavior).map { (email,pass) in
            return email.count >= 8 && pass.count >= 8
        }.observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] state in
            guard let self = self else{ return }
            self.view?.changeStateOFLoginButton(state: state)
        }).disposed(by: bag)
    }
    
    
    
    func goToRegisterView() {
        router?.startWithRegisterView()
    }
}
