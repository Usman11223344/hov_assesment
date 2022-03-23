//
//  UserDetailViewController.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import UIKit

// MARK: - UserDetail Display Protocol
protocol UserDetailDisplayLogic: AnyObject {
    func displayUserDetail(viewData: UserDetailViewController.UserDetail.ViewData)
    func displayError(errorString: String)
}

// MARK: - UserDetailViewController
class UserDetailViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib.init(nibName: "UserDetailTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
        }
    }
    
    // MARK: - Properties
    var interactor: UserDetailInteractorProtocol?
    var router: UserDetailRouter?
    var viewData: UserDetail.ViewData?
    
    // MARK: - Models
    enum UserDetail {
        
        struct ViewData {
            let header: Header
            let section: Section
        }

        struct Header {
            let userName: String
            let avatarUrl: String
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
            let userDetailCellData: UserDetailTableViewCell.ViewData
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        getUserDetail() 
    }
    
    // MARK: - Helping Methods
    
    private func getUserDetail() {
        interactor?.getUserDetail()
    }
    
    private func setUpNavigationBar() {
        
        // Setting title, title text color and font of navigation bar
        self.title = "User Detail"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.Themes.mainTitleColor]
        
        // Settings tint color of navigation bar
        self.navigationController?.navigationBar.tintColor = UIColor.Themes.mainTitleColor
        
        // remove text from back button of navigation bar
        self.navigationController?.navigationBar.topItem?.title = " "
        
    }
    
    private func setHeaderView() {
        guard let _viewData = viewData else { return }
        
        let headerView = UserDetailHeaderView.init(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 230))
        headerView.configure(with: .init(name: _viewData.header.userName, image: _viewData.header.avatarUrl))
        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.frame.size.height = 230
    }
    
    private func set(view: UserDetail.ViewData) {
        self.viewData = view
    }
    
    // MARK: - Actions
    @objc private func infoButtonAction(sender: UIButton) {
        
    }
}

// MARK: - UserDetailDisplayLogic
extension UserDetailViewController: UserDetailDisplayLogic {
    func displayUserDetail(viewData: UserDetailViewController.UserDetail.ViewData) {
        self.set(view: viewData)
        self.setHeaderView()
        self.tableView.reloadData()
    }
    func displayError(errorString: String) {
        self.showToast(message: errorString)
    }
    
}

// MARK: - UITableViewDelegate
extension UserDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

// MARK: - UITableViewDataSource
extension UserDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData?.section.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let _viewData = viewData, indexPath.row < _viewData.section.rows.count  else { return UITableViewCell() }

        let section = _viewData.section
        let row = section.rows[indexPath.row]

        let cell: UserDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as! UserDetailTableViewCell
        cell.configure(with: row.userDetailCellData)
        return cell
    }
    
}
