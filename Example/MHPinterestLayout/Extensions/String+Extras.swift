//
//  String+Extras.swift
//  MHPinterestLayout
//
//  Created by Michael Henry Pantaleon on 2017/08/04.
//  Copyright © 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit
extension String {
  func computedHeight(atWidth width:CGFloat, font: UIFont) -> CGFloat  {
    let rect = self.boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [kCTFontAttributeName as NSAttributedString.Key: font], context: nil)
    return ceil(rect.height)
  }
}
