//
//  UsersListInteractor.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

// MARK: - UsersInteractorProtocol
protocol UsersInteractorProtocol {
    func viewDidLoad()
    var presenter: UsersPresentationProtocol? { get set }
}

// MARK: - UsersInteractor
class UsersInteractor {
    var presenter: UsersPresentationProtocol?
    init(presenter: UsersPresentationProtocol) {
        self.presenter = presenter
    }
    
    private func getUsers() {
        APIWorker.getUsers { [weak self] (result) in
            switch result {
            case .success(let users):
                guard let usersList = users as? [User] else {
                    self?.presenter?.presentError(errorString: "Something went wrong");return
                }
                self?.populateData(with: usersList)
                break
            case .failure(let errorString):
                self?.presenter?.presentError(errorString: errorString)
                break
            }
        }
    }
    
    private func populateData(with list: [User]) {
        
        var rows = [UsersViewController.UserList.Row]()
        for item in list {
            rows.append(.init(userCellData: .init(user: item)))
        }

        let viewData = UsersViewController.UserList.ViewData.init(section: .init(rows: rows))
        presenter?.presentUsers(viewData: viewData)

    }
}

// MARK: - UsersInteractor delegates
extension UsersInteractor: UsersInteractorProtocol {
    
    func viewDidLoad() {
        getUsers()
    }
    
    
}
