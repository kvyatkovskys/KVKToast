//
//  ViewController.swift
//  KVKToast-Example
//
//  Created by Sergei Kviatkovskii on 25.08.2021.
//

import UIKit
import KVKToast

final class ViewController: UIViewController, KVKToastDisplayable {
        
    private lazy var displayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Display", for: .normal)
        button.isSelected = false
        button.addTarget(self, action: #selector(controlToasts), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayButton.frame = CGRect(x: 0, y: 200, width: view.bounds.width, height: 50)
        view.addSubview(displayButton)
    }

    @objc private func controlToasts(sender: UIButton) {
        sender.isSelected.toggle()
        
        if !sender.isSelected {
            removeAllToasts()
            sender.setTitle("Display", for: .normal)
        } else {
            displayToast("Test Toast!",
                         message: "Success!",
                         position: .top,
                         duration: 5)
            displayToast("Test Toast!",
                         message: "Dispose of any resources!",
                         position: .center,
                         duration: 10)
            displayToast("Test Toast!",
                         message: "Dispose of any resources!\nTest image display text",
                         position: .bottom,
                         duration: 20)
            sender.setTitle("Hide", for: .normal)
        }
    }

}

