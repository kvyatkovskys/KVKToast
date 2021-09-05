//
//  ToastProtocol.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

public protocol KVKToastDisplayable: AnyObject {}

@available(iOS 10.0, *)
extension KVKToastDisplayable where Self: UIViewController {
        
    public func displayToast(_ title: String,
                             message: String? = nil,
                             image: UIImage? = nil,
                             position: ToastPosition = .top,
                             type: ToastType = .info,
                             duration: Double = 3.0)
    {
        view.showToast(title: title, message: message, image: image, position: position, duration: duration)
        type.notificationFeedback()
    }
    
    public func hideAllToasts() {
        view.removeAllToasts()
    }
    
    public func hideToast() {
        view.removeToast()
    }
    
}

// MARK: Privates

@available(iOS 10.0, *)
extension UIView: ToastTimer, ToastStore {
    
    func removeAllToasts() {
        stopAllTimers()
    }
    
    func removeToast() {
        stopTimer(lastActiveToastKey)
    }
    
    func showToast(title: String, message: String?, image: UIImage?, position: ToastPosition, duration: Double) {
        let actualStyle = ToastStyle.shared.actualStyle
        var heightToast = actualStyle.minHeight
        let defaultTopOffset = UIApplication.shared.statusBarHeight + 5
        let defaultBottomOffset = actualStyle.minHeight + 5
        
        var widthToast: CGFloat = 300
        if let text = message {
            let messageWidth = text.width(withHeight: heightToast, font: actualStyle.messageFont) + 40
            if messageWidth > UIScreen.main.bounds.width {
                widthToast = UIScreen.main.bounds.width - 20
            } else if messageWidth > widthToast {
                widthToast = messageWidth
            }
            
            let messageHeight = text.height(withWidth: widthToast, font: actualStyle.titleFont) + 30
            if messageHeight > heightToast {
                heightToast = messageHeight + 10
            }
        }
        
        let offset: CGFloat
        let topY: CGFloat
        switch position {
        case .top:
            if #available(iOS 11.0, *) {
                topY = safeAreaInsets.top
            } else {
                topY = defaultTopOffset
            }
            offset = -(heightToast + topY + 10)
        case .center:
            offset = 0
            topY = frame.height * 0.5 - 25
        case .bottom:
            if #available(iOS 11.0, *) {
                offset = safeAreaInsets.bottom + heightToast + 10
                topY = frame.height - safeAreaInsets.bottom - heightToast
            } else {
                offset = defaultBottomOffset + heightToast + 10
                topY = defaultBottomOffset
            }
        }
        
        let toast = ToastView(parameters: .init(title: title, message: message, image: image),
                              frame: CGRect(x: (frame.width * 0.5) - (widthToast * 0.5),
                                            y: topY,
                                            width: widthToast,
                                            height: heightToast))
        toast.layer.cornerRadius = actualStyle.cornerRadius
        toast.layer.masksToBounds = true
        toast.transform = CGAffineTransform(translationX: 0, y: offset)
        
        addSubview(toast)
        showToast(toast, duration: duration, position: position, offset: offset)
    }
    
    func showToast(_ toast: UIView, duration: Double, position: ToastPosition, offset: CGFloat) {
        if position == .center {
            toast.alpha = 0
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseInOut) {
            if position == .center {
                toast.alpha = 1
            } else {
                toast.transform = .identity
            }
        } completion: { (_) in
            let key = self.lastActiveToastKey + 1
            self.saveToast(key, toast: toast)
            self.startTimer(key, interval: duration) { [weak self] in
                self?.hideToast(toast: toast, position: position, offset: offset) { [weak self] in
                    let removedToast = self?.removeToast(key)
                    removedToast?.removeFromSuperview()
                }
            }
        }
    }
    
    func hideToast(toast: UIView, position: ToastPosition, offset: CGFloat, completion: @escaping Action) {
        UIView.animate(withDuration: 1) {
            if position == .center {
                toast.alpha = 0
            } else {
                toast.transform = CGAffineTransform(translationX: 0, y: offset)
            }
        } completion: { _ in
            completion()
        }
    }
    
}

#endif
