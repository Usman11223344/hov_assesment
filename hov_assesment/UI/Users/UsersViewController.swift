//
//  UsersListViewController.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import UIKit
import MBProgressHUD

// MARK: - Master Display Protocol
protocol UsersDisplayLogic: AnyObject {
    func displayUsers(viewData: UsersViewController.UserList.ViewData)
    func displayError(errorString: String)
}


class UsersViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: UsersInteractorProtocol?
    weak var router: UsersRouter?
    var viewData: UserList.ViewData?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib.init(nibName: "UserTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: UserTableViewCell.identifier)
            
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(reloadUsersList), for: UIControl.Event.valueChanged)
            tableView.refreshControl = refreshControl
        }
    }

    // MARK: - Models
    enum UserList {
        
        struct ViewData {
            let section: Section
        }
        
        struct Section {
                        
            let rows: [Row]
            
            var count: Int {
                return rows.count
            }
            
            subscript(_ index: Int) -> Row {
                return rows[index]
            }
        }
        
        struct Row {
            var userCellData: UserTableViewCell.ViewData?
        }

    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsersList()
    }
    
    // MARK: - Actions
    @IBAction func reloadUsersList() {
        UserDataStore.store.deleteAllUser()
        getUsersList()
    }
    
    // MARK: - Helping Methods
    
    func getUsersList() {
        self.showHUD()
        self.interactor?.viewDidLoad()
    }
    
    private func set(viewData: UserList.ViewData) {
        self.viewData = viewData
    }
}

// MARK: - UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _viewData = viewData, indexPath.row < _viewData.section.rows.count  else { return }
        let section = _viewData.section
        let row = section.rows[indexPath.row]
        router?.showDetail(vc: self, forUser: row.userCellData!.user)
    }
}

// MARK: - UITableViewDataSource
extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData?.section.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let _viewData = viewData, indexPath.row < _viewData.section.rows.count  else { return UITableViewCell() }

        let section = _viewData.section
        let row = section.rows[indexPath.row]

        let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        cell.configure(with: row.userCellData!)
        return cell
    }
    
}

// MARK: - Master Display delegates
extension UsersViewController: UsersDisplayLogic {
    func displayUsers(viewData: UsersViewController.UserList.ViewData) {
        self.set(viewData: viewData)
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.dismissHUD()
            self.tableView.reloadData()
        }
    }
    
    func displayError(errorString: String) {
        DispatchQueue.main.async {
            self.showToast(message: errorString)
            self.tableView.refreshControl?.endRefreshing()
            self.dismissHUD()
        }
    }
}
