//
//  ToastView.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

import UIKit

final class ToastView: UIView {
    
    struct Parameters {
        let title: String
        var message: String?
        var image: UIImage?
    }
    
    private let title: String
    private let message: String?
    private let image: UIImage?
    
    init(parameters: Parameters, frame: CGRect) {
        self.title = parameters.title
        self.message = parameters.message
        self.image = parameters.image
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
