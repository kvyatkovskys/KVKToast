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
protocol ToastTimer: AnyObject {}

extension ToastTimer {
    
    private var timers: [String: Timer] {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.timer) as? [String: Timer] ?? [:] }
        set { objc_setAssociatedObject(self, &AssociatedKeys.timer, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    func stopTimer(_ key: String = "Timer") {
        timers[key]?.invalidate()
        timers[key] = nil
    }
    
    func startTimer(_ key: String = "Timer", interval: TimeInterval = 1, action: @escaping () -> Void) {
        if #available(iOS 10.0, *) {
            timers[key] = Timer.scheduledTimer(withTimeInterval: interval, repeats: false, block: { _ in
                action()
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
}

#endif
