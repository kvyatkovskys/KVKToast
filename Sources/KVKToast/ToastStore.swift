//
//  ToastStore.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

private enum AssociatedKeys {
    static var toast: String = "com.toast.store-toasts"
}

protocol ToastStore: AnyObject {}

extension ToastStore {
    
    private var toasts: [Int: ToastView] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.toast) as? [Int: ToastView] ?? [:] }
        set { objc_setAssociatedObject(self, &AssociatedKeys.toast, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    var lastActiveToastKey: Int {
        toasts.keys.sorted(by: { $0 > $1 }).first ?? 0
    }
    
    @discardableResult
    func removeToast(_ key: Int) -> ToastView? {
        toasts.removeValue(forKey: key)
    }
    
    func saveToast(_ key: Int, toast: ToastView) {
        toasts[key] = toast
    }
    
    func getToast(_ key: Int) -> ToastView? {
        toasts[key]
    }
    
}

#endif
