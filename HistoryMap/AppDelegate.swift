//
//  AppDelegate.swift
//  HistoryMap
//
//  Created by Rumata on 7/17/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import UIKit
import ReSwift
import Firebase

let store = Store<AppState>(reducer: AppReducer(), state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    FIRApp.configure()

    let action = AddServiceAction(service: FirebaseService())
    store.dispatch(action)

    return true
  }

}

