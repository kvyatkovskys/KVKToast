//
//  ViewController.swift
//  KVKToast
//
//  Created by kvyatkovskys on 10/01/2020.
//  Copyright (c) 2020 kvyatkovskys. All rights reserved.
//

import UIKit
import KVKToast

class ViewController: UIViewController, KVKToastDisplayable {

    override func viewDidLoad() {
        super.viewDidLoad()
        displayToast("Test Toast!", message: "Dispose of any resources that can be recreated.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

