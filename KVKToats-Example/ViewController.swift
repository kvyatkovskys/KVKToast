//
//  ViewController.swift
//  KVKToast-Example
//
//  Created by Sergei Kviatkovskii on 25.08.2021.
//

import UIKit
import KVKToast

final class ViewController: UIViewController {
        
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
            view.hideToast()
            sender.setTitle("Display", for: .normal)
        } else {
            var testImage: UIImage?
            if #available(iOS 13.0, *) {
                testImage = UIImage(systemName: "trash")
            }
            
            view.displayToast("Title", position: .top, duration: 5)
            view.displayToast("Title!",
                              message: "Description!",
                              position: .center,
                              duration: 10)
            view.displayToast("Title!",
                              message: "Description!\nAnd image!",
                              image: testImage,
                              position: .bottom,
                              duration: 20)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                self?.view.displayToast("Toast with delay!",
                                        position: .top,
                                        duration: 3)
            }
            
            sender.setTitle("Hide", for: .normal)
        }
    }

}

