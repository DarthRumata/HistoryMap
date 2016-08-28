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
import ReSwiftRouter

let store = Store<AppState>(reducer: AppReducer(), state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var router: Router<AppState>!

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    FIRApp.configure()

    window = UIWindow(frame: UIScreen.mainScreen().bounds)

    let rootRoutable = RootRoutable(window: window!)

    router = Router(store: store, rootRoutable: rootRoutable) { state in
      return state.navigationState
    }

    let setMainRouteAction = SetRouteAction([RouteElement.Map.rawValue])
    store.dispatch(setMainRouteAction)

    window!.makeKeyAndVisible()

    return true
  }

}

