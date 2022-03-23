//
//  UsersListCoordinator.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation
import UIKit

// MARK: - Users Router Protocol
protocol UsersRouter: AnyObject {
    func start()
    func showDetail(vc: UIViewController, forUser: User)
}

// MARK: - UsersCoordinator Class
class UsersCoordinator {
    private var window: UIWindow
    private var navigationController: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
    }
}

// MARK: - Routing
extension UsersCoordinator: UsersRouter {
    
    func start() {
        let viewController = UsersViewController.initiateFrom(Storybaord: .main)
        viewController.interactor = UsersInteractor(presenter: UsersPresenter(viewController: viewController))
        viewController.router = self
        self.window.rootViewController = UINavigationController(rootViewController: viewController)
    }
    
    func showDetail(vc: UIViewController, forUser user: User) {
        let userDetailCoordinator = UserDetailCoordinator()
        userDetailCoordinator.start(from: vc, forUser: user)
    }
}

