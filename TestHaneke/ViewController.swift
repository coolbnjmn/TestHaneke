//
//  ViewController.swift
//  TestHaneke
//
//  Created by Benjamin Hendricks on 2/26/16.
//  Copyright © 2016 Benjamin Hendricks. All rights reserved.
//

import UIKit
import Haneke

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        CachingManager.sharedInstance.fetchAllThings({
            result in
            // result should be an array of objects
            print(result)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
