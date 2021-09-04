//
//  ToastHideAnimation.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 04.09.2021.
//

#if os(iOS)

import Foundation

private enum AssociatedKeys {
    static var actions: UInt8 = 0
}

/// Any object can start and stop delayed action for key
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
    
    func completeAction(key: Int) {
        if let action = actions[key] {
            action()
        }
    }
    
    func completeAllActions() {
        actions.forEach {
            $0.value()
        }
    }
    
}

#endif
