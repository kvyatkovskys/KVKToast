//
//  ToastActive.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

import UIKit

private enum AssociatedKeys {
    static var toast: String = "com.toast.active-toasts"
}

/// Any object can start and stop delayed action for key
protocol ToastActive: AnyObject {}

extension ToastActive {
    
    private var toasts: [String: UIView] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.toast) as? [String: UIView] ?? [:] }
        set { objc_setAssociatedObject(self, &AssociatedKeys.toast, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    func disableToast(_ key: String = "activeToast") {
        toasts.removeValue(forKey: key)
    }
    
    func enableToast(_ key: String = "activeToast", toast: UIView) {
        toasts[key] = toast
    }
}
