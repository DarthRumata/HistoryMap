//
//  FetchHistoryEventsOperation.swift
//  HistoryMap
//
//  Created by Rumata on 8/14/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import ReSwift

struct FetchHistoryEventsOperation {

  static func perform(state: AppState, store: Store<AppState>) -> Action? {
    let firebase: FirebaseService = state.locator.getService()

    firebase.getHistoryEvents { events in
      if let events = events {
        store.dispatch(SetHistoryEvents(events: events))
      }
    }

    return nil
  }
  
}

