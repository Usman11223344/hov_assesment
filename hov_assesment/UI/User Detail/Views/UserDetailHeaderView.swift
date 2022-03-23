//
//  ProfileHeaderView.swift
//  Assesment
//
//  Created by Usman on 23/03/2022.
//

import UIKit
import SDWebImage

class UserDetailHeaderView: UIView {
    
    //MARK: - IBOutlet
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        }
    }
    
    
    //MARK: - Properties
    private let kCONTENT_XIB_NAME = "UserDetailHeaderView"
    
    struct ViewData {
        let name : String
        let image: String
    }
    
    // MARK: - Lifecycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
    }
    
    func configure(with viewData: ViewData) {
        userNameLabel.text = viewData.name
        profileImageView.sd_setImage(with: .init(string: viewData.image)) { image, error, cacheType, url in
            
        }
    }
    
}
