//
//  ItemCellDelegate.swift
//  MHPinterestLayout
//
//  Created by Michael Henry Pantaleon on 2017/08/02.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

protocol ItemCellDelegate {

    func itemCell(_ itemCell:ItemCollectionViewCell, paddingAtIndexPath:IndexPath) -> UIEdgeInsets
    
    func itemCell(_ itemCell:ItemCollectionViewCell, heightOfImageAtIndexPath:IndexPath) -> CGFloat
    
    func itemCell(_ itemCell:ItemCollectionViewCell, heightOfCaptionAtIndexPath:IndexPath) -> CGFloat
    
}
