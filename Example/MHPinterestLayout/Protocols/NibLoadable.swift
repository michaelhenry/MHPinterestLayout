//
//  NibLoadable.swift
//  MHPinterestLayout_Example
//
//  Created by Michael Henry Pantaleon on 2018/06/14.
//  Copyright © 2018 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

protocol NibLoadableView {
  static var nib:UINib { get }
}

extension NibLoadableView where Self: UIView {
  static var nib: UINib {
    let className = String(describing: self)
    return UINib(nibName: className, bundle: Bundle(for: self))
  }
}
