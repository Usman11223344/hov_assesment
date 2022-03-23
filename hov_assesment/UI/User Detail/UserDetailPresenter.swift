//
//  UserDetailPresenter.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import Foundation

// MARK: - Presentation Protocol
protocol UserDetailPresentationProtocol {
    func presentUserDetail(viewData: User)
    func presentError(errorString: String)
}

// MARK: - Presenter Class
class UserDetailPresenter {
    weak var viewController: UserDetailDisplayLogic?
    
    init(viewController: UserDetailDisplayLogic) {
        self.viewController = viewController
    }
}

// MARK: - Presenter Delegates
extension UserDetailPresenter: UserDetailPresentationProtocol {
    
    func presentUserDetail(viewData: User) {
        
        var rows: [UserDetailViewController.UserDetail.Row] = []
        rows.append(.init(userDetailCellData: .init(title: "Node Id", value: viewData.nodeID ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Url", value: viewData.url ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "HTML Url", value: viewData.htmlURL ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Followers", value: viewData.followersURL ?? "")))

        rows.append(.init(userDetailCellData: .init(title: "Following Url", value: viewData.followingURL ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Gists", value: viewData.gistsURL ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Starred", value: viewData.starredURL ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Subscriptions", value: viewData.subscriptionsURL ?? "")))

        rows.append(.init(userDetailCellData: .init(title: "Organizations", value: viewData.organizationsURL ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Repos", value: viewData.reposURL ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Received Events", value: viewData.receivedEventsURL ?? "")))
        rows.append(.init(userDetailCellData: .init(title: "Type", value: viewData.type ?? "")))

        let siteAdmin = (viewData.siteAdmin == true) ? "True" : "False"
        rows.append(.init(userDetailCellData: .init(title: "Site Admin", value: siteAdmin)))

        let header = UserDetailViewController.UserDetail.Header.init(userName: viewData.login ?? "", avatarUrl: viewData.avatarURL ?? "")
        
        let detailViewData = UserDetailViewController.UserDetail.ViewData.init(header: header, section: .init(rows: rows))
        viewController?.displayUserDetail(viewData: detailViewData)
        
    }
    
    func presentError(errorString: String) {
        viewController?.displayError(errorString: errorString)
    }
}
