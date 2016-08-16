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
    var state = state ?? AppState(historyEvents: [])

    switch action {
    case let action as AddServiceAction:
      state.locator.registerService(action.service)

    case let action as SetHistoryEvents:
      state.historyEvents.removeAll()
      state.historyEvents.appendContentsOf(action.events)

    default:
      break
    }

    return state
  }

}