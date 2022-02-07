//
//  LoginViewController.swift
//  Swinject_Project
//
//  Created by Ahmed Fathy on 07/02/2022.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {

    var presenter: LoginPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

}
