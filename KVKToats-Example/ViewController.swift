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
            self?.displayToast("Test Toast!",
                               message: "Success!",
                               position: .top,
                               duration: 5)
            self?.displayToast("Test Toast!",
                               message: "Dispose of any resources!",
                               position: .center,
                               duration: 10)
            self?.displayToast("Test Toast!",
                               message: "Dispose of any resources!\nTest image display text",
                               position: .bottom,
                               duration: 20)
        }
    }


}

