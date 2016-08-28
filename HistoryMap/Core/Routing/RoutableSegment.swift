//
//  RoutableSegment.swift
//  HistoryMap
//
//  Created by Rumata on 8/28/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import ReSwiftRouter


protocol RoutableSegment: Routable {

  unowned var viewController: UIViewController { get }
  
}