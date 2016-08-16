//
//  ViewController.swift
//  HistoryMap
//
//  Created by Rumata on 7/17/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import UIKit
import Mapbox
import ReSwift

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MGLMapView!

  override func viewDidLoad() {
    super.viewDidLoad()

    store.subscribe(self)

    store.dispatch(FetchHistoryEventsOperation.perform)
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)

    store.subscribe(self)
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)

    store.unsubscribe(self)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension MapViewController: StoreSubscriber {


  func newState(state: AppState) {
    if let annotations = mapView.annotations {
      mapView.removeAnnotations(annotations)
    }

    for event in state.historyEvents {
      var event = event
      let annotation = MGLPointAnnotation()
      annotation.coordinate = event.coordinate
      annotation.title = event.description
      mapView.addAnnotation(annotation)
    }
  }
  
}

