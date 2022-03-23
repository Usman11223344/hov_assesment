//
//  UserTableViewCell.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userUrlLabel: UILabel!
    @IBOutlet private weak var userAvatarImageView: UIImageView!

    // MARK: - Properties
    
    static var identifier: String = "UserTableViewCell"
    
    struct ViewData {
        let user: User
    }

    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Helping Methods
    func configure(with viewData: ViewData) {
        userNameLabel.text = viewData.user.login
        userUrlLabel.text = viewData.user.htmlURL
        userAvatarImageView.sd_setImage(with: URL(string: viewData.user.avatarURL ?? "")) { image, error, type, url in
            
        }
    }
    
}
