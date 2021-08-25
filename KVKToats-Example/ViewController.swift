//
//  ViewController.swift
//  KVKToast-Example
//
//  Created by Sergei Kviatkovskii on 25.08.2021.
//

import UIKit
import KVKToast

class ViewController: UIViewController, KVKToastDisplayable {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.displayToast("Test Toast!", message: "Dispose of any resources!")
        }
    }


}

