//
//  ToastProtocol.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//
import UIKit

@available(iOS 10.0, *)
public protocol KVKToastDisplayable {}

@available(iOS 10.0, *)
extension KVKToastDisplayable where Self: UIViewController {
    public func displayToast(_ title: String, message: String? = nil, image: UIImage? = nil, position: ToastPosition = .top, type: ToastType = .info, duration: Double = 3.0, style: ToastStyle = ToastStyle()) {
        view.showToast(title: title, message: message, image: image, position: position, duration: duration, style: style)
        type.notificationFeedback()
    }
}

// MARK: Privates

extension UIView {
    fileprivate func showToast(title: String, message: String?, image: UIImage?, position: ToastPosition, duration: Double, style: ToastStyle) {
        var heightToast: CGFloat = 50
        let defaultTopOffset = UIApplication.shared.statusBarFrame.height + 5
        let defaultBottomOffset: CGFloat = 55
        let topY: CGFloat
        
        switch position {
        case .top:
            if #available(iOS 11.0, *) {
                topY = safeAreaInsets.top
            } else {
                topY = defaultTopOffset
            }
        case .center:
            topY = frame.height * 0.5 - 25
        case .bottom:
            if #available(iOS 11.0, *) {
                topY = frame.height - safeAreaInsets.bottom - heightToast
            } else {
                topY = defaultBottomOffset
            }
        }
        
        var testImage = image
        if #available(iOS 13.0, *) {
            testImage = UIImage(systemName: "trash")
        }
        
        var widthToast: CGFloat = 300
        if let text = message {
            let messageWidth = text.width(withHeight: heightToast, font: .appFont(size: 17)) + 40
            if messageWidth > UIScreen.main.bounds.width {
                widthToast = UIScreen.main.bounds.width - 20
                let messageHeight = text.height(withWidth: widthToast, font: .appFont(size: 17)) + 40
                if messageHeight > heightToast {
                    heightToast = messageHeight + 20
                }
            } else if messageWidth > widthToast {
                widthToast = messageWidth
            }
        }
        
        let toast = ToastView(parameters: .init(title: title, message: message, image: testImage, style: style),
                              frame: CGRect(x: (frame.width * 0.5) - (widthToast * 0.5), y: topY, width: widthToast, height: heightToast))
        toast.layer.cornerRadius = 25
        toast.layer.masksToBounds = true
        toast.transform = CGAffineTransform(translationX: 0, y: -(heightToast + topY))
        addSubview(toast)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut) {
            toast.transform = .identity
        } completion: { (_) in
            
        }

    }
}
