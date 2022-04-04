//
//  ViewController.swift
//  ADNavigationBar
//
//  Created by Daniel on 04/02/2022.
//  Copyright (c) 2022 Daniel. All rights reserved.
//

import UIKit
@testable import ADNavigationBar

class ViewController: UIViewController {

    let navigation = ADNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addNavigationBar(title: "Hello world!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
