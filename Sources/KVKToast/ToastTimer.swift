//
//  ToastTimer.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import Foundation

private enum AssociatedKeys {
    static var timer: UInt8 = 0
}

/// Any object can start and stop delayed action for key
protocol ToastTimer: ToastAction {}

extension ToastTimer {
    
    private var timers: [Int: Timer] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.timer) as? [Int: Timer] ?? [:] }
        set { objc_setAssociatedObject(self, &AssociatedKeys.timer, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    func stopTimer(_ key: Int) {
        timers[key]?.invalidate()
        timers[key] = nil
        completeAction(key: key)
    }
    
    func startTimer(_ key: Int, interval: TimeInterval = 1, action: @escaping Action) {
        addAction(key: key, action: action)
        
        timers[key] = Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { [weak self] _ in
            self?.completeAction(key: key)
        })
    }
    
    func stopAllTimers() {
        timers.forEach {
            $0.value.invalidate()
        }
        timers.removeAll()
        completeAllActions()
    }
    
}

#endif
