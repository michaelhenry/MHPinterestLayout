//
//  RoundedCorners.swift
//  MHPinterestLayout_Example
//
//  Created by Michael Henry Pantaleon on 2018/06/14.
//  Copyright © 2018 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

class RoundedCornerView:UIView {
  
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
}

class RoundedCornerButton:UIButton {
  
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
      layer.masksToBounds = cornerRadius > 0
    }
  }
}
