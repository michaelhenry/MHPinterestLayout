//
//  ItemCollectionViewCell.swift
//  MHPinterestLayout
//
//  Created by Michael Henry Pantaleon on 2017/08/01.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var attachmentView: UIImageView!

    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var captionHeightConstraint: NSLayoutConstraint!
    
    var delegate:ItemCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        captionLabel.font = AppFont.caption.value

    }
}
