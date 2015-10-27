//
//  ViewController.swift
//  swiftTest
//
//  Created by Horex on 15/10/19.
//  Copyright © 2015年 Horex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mobile = Mobile(brand: "iPhone", system: "iOS 9.0")
        let swiftMobile = mobile as SwiftMobile
        print("\(swiftMobile.brand)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

