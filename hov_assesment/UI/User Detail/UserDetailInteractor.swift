//
//  UserDetailInteractor.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

// MARK: - UserDetailInteractorProtocol
protocol UserDetailInteractorProtocol {
    func viewDidLoad()
    func getUserDetail()
    var user: User? { get }
}

// MARK: - UserDetailInteractor
class UserDetailInteractor {
    var presenter: UserDetailPresentationProtocol?
    internal var user: User?
    init(presenter: UserDetailPresentationProtocol, user: User?) {
        self.presenter = presenter
        self.user = user
    }
}

// MARK: - UserDetailInteractor delegates
extension UserDetailInteractor: UserDetailInteractorProtocol {
    
    func viewDidLoad() {
        
    }
    
    func getUserDetail() {
        guard let _user = user else { presenter?.presentError(errorString: "User detail not found");return
        }
        presenter?.presentUserDetail(viewData: _user)
        
    }
}
