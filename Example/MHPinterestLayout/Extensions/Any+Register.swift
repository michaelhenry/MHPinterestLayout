//
//  Any+Register.swift
//  MHPinterestLayout_Example
//
//  Created by Michael Henry Pantaleon on 2018/06/14.
//  Copyright © 2018 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

extension UITableViewCell:NibLoadableView {}
extension UITableViewCell:ReusableView {}
extension UICollectionReusableView:NibLoadableView {}
extension UICollectionReusableView:ReusableView {}

extension UITableView {
  
  func register<T: UITableViewCell >(_: T.Type) {
    register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
}

extension UICollectionView {
  
  func registerHeader<T: UICollectionReusableView>(_: T.Type) {
    register(T.nib,
             forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
             withReuseIdentifier: T.reuseIdentifier)
  }
  
  func register<T: UICollectionViewCell >(_: T.Type) {
      register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
  }
}
