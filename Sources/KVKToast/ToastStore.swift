//
//  ToastStore.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

private enum AssociatedKeys {
    static var toast: String = "com.toast.active-toasts"
}

/// Any object can start and stop delayed action for key
protocol ToastStore: AnyObject {}

extension ToastStore {
    
    private var toasts: [Int: UIView] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.toast) as? [Int: UIView] ?? [:] }
        set { objc_setAssociatedObject(self, &AssociatedKeys.toast, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    var lastActiveToastKey: Int {
        toasts.keys.sorted(by: { $0 > $1 }).first ?? 0
    }
    
    @discardableResult
    func removeToast(_ key: Int) -> UIView? {
        let toast = toasts.removeValue(forKey: key)
        print(toasts, "🚨🚨")
        return toast
    }
    
    func saveToast(_ key: Int, toast: UIView) {
        toasts[key] = toast
        print(toasts, "🚨")
    }
}

#endif
