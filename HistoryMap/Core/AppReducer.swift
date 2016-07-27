//
//  AppReducer.swift
//  HistoryMap
//
//  Created by Rumata on 7/19/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer: Reducer {

  func handleAction(action: Action, state: AppState?) -> AppState {
    return state ?? AppState()
  }

}