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

// MARK: Private Protocol

protocol ToastProtocol: class {
    func showToast(title: String, message: String?, image: UIImage?, position: ToastPosition, duration: Double, style: ToastStyle)
}

extension UIView: ToastProtocol {
    func showToast(title: String, message: String?, image: UIImage?, position: ToastPosition, duration: Double, style: ToastStyle) {
        print(title, message)
    }
}
