//
//  ToastHideAnimation.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 04.09.2021.
//

#if os(iOS)

import Foundation

private enum AssociatedKeys {
    static var actions: String = "com.toast.action-toasts"
}

protocol ToastAction: AnyObject {}

extension ToastAction {
    
    typealias Action = () -> Void
    
    private var actions: [Int: Action] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.actions) as? [Int: Action] ?? [:] }
        set { objc_setAssociatedObject(self, &AssociatedKeys.actions, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    func addAction(key: Int, action: @escaping Action) {
        actions[key] = action
    }
    
    func getAction(key: Int) -> Action? {
        actions[key]
    }
    
    func removeAction(key: Int) {
        actions[key] = nil
    }
    
    func completeAction(key: Int) {
        if let action = actions[key] {
            action()
        }
        actions[key] = nil
    }
    
    func completeAllActions() {
        actions.forEach {
            $0.value()
        }
        actions.removeAll()
    }
    
}

#endif
