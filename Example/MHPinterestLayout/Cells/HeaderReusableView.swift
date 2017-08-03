//
//  HeaderReusableView.swift
//  MHPinterestLayout
//
//  Created by Michael Henry Pantaleon on 2017/08/01.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//
import UIKit

class HeaderReusableView: UICollectionReusableView {

    @IBOutlet weak var followingsLabel: UILabel!
    @IBOutlet weak var followingsCountLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var postsCountLabel: UILabel!
    @IBOutlet weak var postsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postsLabel.font = AppFont.userStatInfoLabel.value
        followingsLabel.font = AppFont.userStatInfoLabel.value
        followersLabel.font = AppFont.userStatInfoLabel.value
        
        postsCountLabel.font = AppFont.userStatInfoValue.value
        followingsCountLabel.font = AppFont.userStatInfoValue.value
        followersCountLabel.font = AppFont.userStatInfoValue.value
        
        postsCountLabel.textColor = UIColor.gray
        followingsCountLabel.textColor = UIColor.gray
        followersCountLabel.textColor = UIColor.gray
        
    }
    
}
