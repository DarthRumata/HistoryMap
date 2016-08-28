//
//  MapRoutableSegment.swift
//  HistoryMap
//
//  Created by Rumata on 8/28/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import ReSwiftRouter


struct MapRoutableSegment: RoutableSegment {

  unowned let viewController: UIViewController

  init(viewController: UIViewController) {
    self.viewController = viewController
  }

}