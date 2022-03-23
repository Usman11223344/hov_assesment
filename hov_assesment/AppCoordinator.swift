//
//  AppCoordinator.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation
import UIKit

// MARK: - AppRouter Protocol
protocol AppRouter: AnyObject {
    func start()
}

final class AppCoordinator {
    
    private var window: UIWindow
    private var usersCoordinator: UsersCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: - Private Methods
    private func showUsers() {
        self.usersCoordinator = UsersCoordinator.init(window: window)
        self.usersCoordinator?.start()
    }
}

// MARK: - AppRouter Delegates
extension AppCoordinator: AppRouter {
    
    func start() {
        self.window.backgroundColor = .white
//        self.window.overrideUserInterfaceStyle = .light
        self.window.makeKeyAndVisible()
        showUsers()
    }
}
