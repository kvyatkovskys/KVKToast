//
//  ToastModel.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

public enum ToastPosition: Int {
    case top, center, bottom
}

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

extension ToastType {
    
    var style: ToastStyle {
        var style = ToastStyle.shared.actualStyle
        
        switch self {
        case .error, .warning:
            style.backgroundColor = .systemRed
            style.titleColor = .white
            style.messageColor = .white
        default:
            break
        }
        
        return style
    }
    
}

#endif
