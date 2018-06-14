//
//  UIImage+Extras.swift
//  MHPinterestLayout
//
//  Created by Michael Henry Pantaleon on 2017/08/02.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit
import AVFoundation

extension UIImage {
  func computedHeight(atWidth width:CGFloat) -> CGFloat {
    let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
    let rect  = AVMakeRect(aspectRatio: self.size, insideRect: boundingRect)
    return rect.size.height
  }
}
