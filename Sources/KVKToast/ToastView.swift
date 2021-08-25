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
        let message: String?
        let image: UIImage?
        let style: ToastStyle
    }
    
    private let parameters: Parameters
    
    private let stackView: ToastStackView = {
        let stack = ToastStackView()
        return stack
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .appFont(size: 17, weight: .semibold)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    init(parameters: Parameters, frame: CGRect) {
        self.parameters = parameters
        super.init(frame: frame)
        
        backgroundColor = .systemTeal
        //setBlur(style: UIScreen.isDarkMode ? .dark : .light)
        if let img = parameters.image {
            imageView.image = img
            imageView.frame = CGRect(x: 10, y: (frame.height * 0.5) - 12.5, width: 25, height: 25)
            addSubview(imageView)
        }
        
        let titleX: CGFloat
        let titleWidth: CGFloat
        if parameters.image != nil {
            titleX = imageView.frame.origin.x + imageView.frame.width + 10
            titleWidth = frame.width - titleX - 20 - imageView.frame.width
        } else {
            titleX = 10
            titleWidth = frame.width - 20
        }
        let titleHeight: CGFloat
        if parameters.message != nil {
            titleHeight = 25
        } else {
            titleHeight = frame.height
        }
        
        titleLabel.text = parameters.title
        titleLabel.frame = CGRect(x: titleX, y: 0, width: titleWidth, height: titleHeight)
        addSubview(titleLabel)
        
        if let message = parameters.message {
            messageLabel.text = message
            messageLabel.frame = CGRect(x: titleLabel.frame.origin.x, y: titleLabel.frame.height, width: titleLabel.frame.width, height: frame.height - titleLabel.frame.height)
            addSubview(messageLabel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        //setBlur(style: UIScreen.isDarkMode ? .dark : .light)
    }
}
