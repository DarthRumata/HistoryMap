//
//  AppState.swift
//  HistoryMap
//
//  Created by Rumata on 7/19/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

struct AppState: StateType {

  var historyEvents: [HistoryEvent]
  let locator: ServiceLocator = ServiceLocator()
  var navigationState: NavigationState

}