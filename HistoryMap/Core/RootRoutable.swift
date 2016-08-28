//
//  Routing.swift
//  HistoryMap
//
//  Created by Rumata on 8/28/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation
import ReSwiftRouter
import UIKit


class RootRoutable {

  private unowned let window: UIWindow

  init(window: UIWindow) {
    self.window = window

    // Dummy controller to pass root controller test at start of app
    window.rootViewController = UIViewController()
  }

}

extension RootRoutable: Routable {

  func pushRouteSegment(routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: RoutingCompletionHandler) -> Routable {
    let routeSegment = self.routeSegment(by: routeElementIdentifier)

    window.rootViewController = routeSegment.viewController
    completionHandler()

    return routeSegment
  }

  func popRouteSegment(routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: RoutingCompletionHandler) {
    fatalError("impossible to pop")
  }

  func changeRouteSegment(from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: RoutingCompletionHandler) -> Routable {
    let toSegment = pushRouteSegment(to, animated: animated, completionHandler: completionHandler)

    return toSegment
  }

  private func routeSegment(by routeElementIdentifier: RouteElementIdentifier) -> RoutableSegment {
    let route = RouteElement(rawValue: routeElementIdentifier)!
    let routeSegment: RoutableSegment

    switch route {
    case .Map:
      let routeSegmentController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(routeElementIdentifier)
      routeSegment = MapRoutableSegment(viewController: routeSegmentController)
      let action = AddServiceAction(service: FirebaseService())
      store.dispatch(action)
    }
    
    return routeSegment
  }
  
}