//
//  UserDetailTableViewCell.swift
//  hov_assesment
//
//  Created by Usman on 23/03/2022.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!
    

    // MARK: - Properties
    
    static var identifier: String = "UserDetailTableViewCell"
    
    struct ViewData {
        let title: String
        let value: String
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
        titleLabel.text = viewData.title
        valueLabel.text = viewData.value
    }
    
}
