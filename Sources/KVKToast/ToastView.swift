//
//  ToastView.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

final class ToastView: UIView {
    
    struct Parameters {
        let title: String
        let message: String?
        let image: UIImage?
        var style: ToastStyle?
        var position: ToastPosition = .top
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
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        return label
    }()
    
    init(parameters: Parameters, frame: CGRect) {
        self.parameters = parameters
        super.init(frame: frame)

        updateStyle()
        
        if let img = parameters.image {
            imageView.image = img
            addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            let leftConstraint = imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5)
            let centerYConstraint = imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
            let widthConstraint = imageView.widthAnchor.constraint(equalToConstant: actualStyle.imageSize.width)
            let heightConstraint = imageView.heightAnchor.constraint(equalToConstant: actualStyle.imageSize.height)
            NSLayoutConstraint.activate([leftConstraint, centerYConstraint, widthConstraint, heightConstraint])
        }
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let leftConstraint: NSLayoutConstraint
        let rightOffset: CGFloat
        if parameters.image != nil {
            rightOffset = actualStyle.imageSize.width + 15
            leftConstraint = stackView.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 5)
        } else {
            rightOffset = 5
            leftConstraint = stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5)
        }
        
        let bottomConstraint = stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        let rightConstraint = stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -rightOffset)
        let topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        NSLayoutConstraint.activate([leftConstraint, rightConstraint, topConstraint, bottomConstraint])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = parameters.title
        stackView.addArrangedSubview(titleLabel)
        
        if let message = parameters.message {
            let heightConstraint = titleLabel.heightAnchor.constraint(equalToConstant: 25)
            NSLayoutConstraint.activate([heightConstraint])
            
            messageLabel.translatesAutoresizingMaskIntoConstraints = false
            messageLabel.text = message
            stackView.addArrangedSubview(messageLabel)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        updateStyle()
    }
    
    private func updateStyle() {
        titleLabel.textAlignment = actualStyle.titleAlignment
        titleLabel.numberOfLines = actualStyle.titleNumberOfLines
        titleLabel.font = actualStyle.titleFont
        titleLabel.textColor = actualStyle.titleColor
        
        messageLabel.textColor = actualStyle.messageColor
        messageLabel.textAlignment = actualStyle.messageAlignment
        messageLabel.font = actualStyle.messageFont
        messageLabel.numberOfLines = actualStyle.messageNumberOfLines
        
        backgroundColor = actualStyle.backgroundColor
        
        if let blur = actualStyle.blur {
            setBlur(style: blur)
        }
    }
    
    private var actualStyle: ToastStyle {
        guard let style = parameters.style else {
            return ToastStyle.shared.actualStyle
        }
        
        return style
    }
    
}

extension ToastView  {
    
    var position: ToastPosition {
        parameters.position
    }
    
}

#endif
