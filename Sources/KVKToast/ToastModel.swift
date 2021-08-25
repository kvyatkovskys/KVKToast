//
//  ToastModel.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

import UIKit

public enum ToastPosition: Int {
    case top, center, bottom
}

@available(iOS 10.0, *)
public enum ToastType: Int {
    case info, success, warning, error
    
    func notificationFeedback() {
        switch self {
        case .info:
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .warning:
            UINotificationFeedbackGenerator().notificationOccurred(.warning)
        case .success:
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .error:
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
    }
}
