//
//  Configurable.swift
//  MHPinterestLayout_Example
//
//  Created by Michael Henry Pantaleon on 2018/06/14.
//  Copyright © 2018 Michael Henry Pantaleon. All rights reserved.
//

protocol Configurable {}

extension Configurable {
  @discardableResult func configure( block: (inout Self) -> Void) -> Self {
    var m = self
    block(&m)
    return m
  }
}
