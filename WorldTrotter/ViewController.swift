//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Derek Gilwa on 5/9/16.
//  Copyright © 2016 gliwaderek.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blueColor()
        view.addSubview(firstView)
    }
}

