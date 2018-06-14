//
//  ReusableView.swift
//  MHPinterestLayout_Example
//
//  Created by Michael Henry Pantaleon on 2018/06/14.
//  Copyright © 2018 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

protocol ReusableView {
  static var reuseIdentifier: String { get }
}

extension ReusableView {
  static var reuseIdentifier: String {
    let className = String(describing: self)
    return "\(className)_Identifier"
  }
}
