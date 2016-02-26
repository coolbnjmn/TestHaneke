//
//  CachingManager.swift
//  TestHaneke
//
//  Created by Benjamin Hendricks on 2/26/16.
//  Copyright © 2016 Benjamin Hendricks. All rights reserved.
//

import UIKit
import Haneke

class CachingManager: NSObject {
    static let sharedInstance : CachingManager = CachingManager()
    
    func fetchAllThings(completion: ([AnyObject] -> Void)?) {
        let fetchingBlock : ()->JSON = {
            
            return JSON.Array(["hi"])
        }
        let fetcher = CustomFetcher<JSON>(key: "HELLO", value: fetchingBlock())
                    // make a network request here for the value

        fetcher.fetch(failure: {
            error in
            print(error)
            }, success: {
                json in
                completion?(json.array)
        })
    }
}


class CustomFetcher<T : DataConvertible> : Fetcher<T> {

    let getValue : () -> T.Result

    init(key: String, @autoclosure(escaping) value getValue : () -> T.Result) {
        self.getValue = getValue
        super.init(key: key)
    }

    override func fetch(failure fail: ((NSError?) -> ()), success succeed: (T.Result) -> ()) {
        let value = getValue()
        succeed(value)
    }

    override func cancelFetch() {}

}
