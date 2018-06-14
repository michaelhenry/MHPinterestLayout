//
//  AppFont.swift
//  MHPinterestLayout
//
//  Created by Michael Henry Pantaleon on 2017/08/02.
//  Copyright (c) 2017 Michael Henry Pantaleon. All rights reserved.
//

import UIKit

enum AppFont  {
  
  case caption
  case userStatInfoLabel
  case userStatInfoValue
  
}

extension AppFont {
  var value:UIFont {
    switch(self) {
    case .caption:
      return UIFont(name: "AvenirNext-Regular", size: 14)!
    case .userStatInfoLabel:
      return UIFont(name: "AvenirNext-Bold", size: 12)!
    case .userStatInfoValue:
      return UIFont(name: "AvenirNext-Regular", size: 14)!
    }
  }
}

