//
//  UsersListPresenter.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

// MARK: - Presentation Protocol
protocol UsersPresentationProtocol {
    func presentUsers(viewData: UsersViewController.UserList.ViewData)
    func presentError(errorString: String)
}

// MARK: - Presenter Class
class UsersPresenter {
    weak var viewController: UsersDisplayLogic?
    
    init(viewController: UsersDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension UsersPresenter: UsersPresentationProtocol {
    
    func presentUsers(viewData: UsersViewController.UserList.ViewData) {
        viewController?.displayUsers(viewData: viewData)
    }
    
    func presentError(errorString: String) {
        viewController?.displayError(errorString: errorString)
        
    }
}
