//
//  ToastProtocol.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//
import UIKit

public protocol KVKToastDisplayable {
    func displayToast(_ title: String, message: String?, image: UIImage?, position: ToastPosition, type: ToastType, duration: Double, style: ToastStyle)
}

public extension KVKToastDisplayable {
    func displayToast(_ title: String, message: String? = nil, image: UIImage? = nil, position: ToastPosition = .top, type: ToastType = .info, duration: Double = 3.0, style: ToastStyle = ToastStyle()) {
        displayToast(title, message: message, image: image, position: position, type: type, duration: duration, style: style)
    }
}

extension KVKToastDisplayable where Self: UIViewController {
    public func displayToast(_ title: String, message: String?, image: UIImage?, position: ToastPosition, type: ToastType, duration: Double, style: ToastStyle) {
        view.showToast(title: title, message: message, image: image, position: position, duration: duration, style: style)
        type.notificationFeedback()
    }
}

// MARK: Privates

extension UIView {
    fileprivate func showToast(title: String, message: String?, image: UIImage?, position: ToastPosition, duration: Double, style: ToastStyle) {
        let heightToast: CGFloat = 50
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
        
        var testImage: UIImage?
        if #available(iOS 13.0, *) {
            testImage = UIImage(systemName: "trash")
        }
        
        let toast = ToastView(parameters: .init(title: title,
                                                message: message,
                                                image: testImage,
                                                style: style),
                              frame: CGRect(x: (frame.width * 0.5) - 125, y: topY, width: 250, height: heightToast))
        toast.layer.cornerRadius = 25
        toast.layer.masksToBounds = true
        addSubview(toast)
    }
}
