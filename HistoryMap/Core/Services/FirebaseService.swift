//
//  FirebaseService.swift
//  HistoryMap
//
//  Created by Rumata on 7/27/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import FirebaseDatabase
import ObjectMapper

final class FirebaseService {

  private lazy var databaseRef = FIRDatabase.database().reference()
  private lazy var historyEventsRef: FIRDatabaseReference = {
    self.databaseRef.child("history_events")
  }()

  func getHistoryEvents(with block: [HistoryEvent]? -> Void) {
    historyEventsRef.observeSingleEventOfType(.Value, withBlock: { snapshot in
      print("\(snapshot)")
      guard let rawEvents = snapshot.value as? [[String: AnyObject]] else {
        return
      }

      let events = Mapper<HistoryEvent>().mapArray(rawEvents)

      block(events)
    })
  }

}