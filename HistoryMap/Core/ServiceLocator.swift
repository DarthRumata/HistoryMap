//
//  ServiceLocator.swift
//  HistoryMap
//
//  Created by Rumata on 8/14/16.
//  Copyright © 2016 DarkMatter. All rights reserved.
//

import Foundation

public class ServiceLocator {

    private var registry = [String: Any]()

    func registerService<T>(service: T) {
        let key = "\(service.dynamicType)"
        registry[key] = service
    }

    public func getService<T>() -> T! {
        let key = "\(T.self)"
        return registry[key] as! T
    }

}