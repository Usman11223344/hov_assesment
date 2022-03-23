//
//  UserDetailCoordinator.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation
import UIKit

// MARK: - UserDetail Router Protocol
protocol UserDetailRouter: AnyObject {
    func start(from source: UIViewController, forUser: User)
}

// MARK: - UserDetailCoordinator Class
class UserDetailCoordinator {
    
}

// MARK: - Routing
extension UserDetailCoordinator: UserDetailRouter {
    
    func start(from source: UIViewController, forUser user: User) {
        let viewController = UserDetailViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = UserDetailInteractor(presenter: UserDetailPresenter(viewController: viewController), user: user)
        viewController.router = self
        source.navigationController?.pushViewController(viewController, animated: true)
    }
}
