//
//  CachingManager.swift
//  TestHaneke
//
//  Created by Benjamin Hendricks on 2/26/16.
//  Copyright © 2016 Benjamin Hendricks. All rights reserved.
//

import UIKit
import Haneke
import Alamofire

class CachingManager: NSObject {
    static let sharedInstance : CachingManager = CachingManager()

    func fetchAllThings(completion: ([AnyObject] -> Void)?) {

        let fetcher = CustomFetcher<JSON>(key: "HELLO")

        fetcher.fetch(failure: {
            error in
            print(error)
            }, success: {
                json in
                completion?(json.array)
        })
    }
}


class CustomFetcher<T : DataConvertible> : Fetcher<JSON> {

    override init(key: String) {

        super.init(key: key)
    }

    override func fetch(failure fail: ((NSError?) -> ()), success succeed: (JSON) -> ()) {
        let endpoint = "www.google.com"
        Alamofire.request(.GET, endpoint, parameters: nil, encoding: .URL, headers: nil)
            .responseJSON {
                (data) -> Void in
                self.onReceiveData(data.data!, failure: fail, success: succeed)
        }
    }

    private func onReceiveData(data: NSData, failure: ((NSError?) -> ()), success: (JSON) -> ()) {
        success(JSON.Array(["HI"]))
    }

    override func cancelFetch() {}

}
