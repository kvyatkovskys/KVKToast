//
//  Swift+Extension.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

import UIKit

extension UIFont {
    static func appFont(size: CGFloat, weight: Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}

extension UIView {
    func setRoundCorners(_ corners: UIRectCorner = .allCorners, radius: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func setBlur(style: UIBlurEffect.Style) {
        let blur = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurView)
    }
}

extension String {
    func height(withWidth width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return actualSize.height
    }
    
    func width(withHeight height: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: .greatestFiniteMagnitude, height: height)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font: font], context: nil)
        return actualSize.width
    }
}

extension UIScreen {
    static var isDarkMode: Bool {
        if #available(iOS 12.0, *) {
            return main.traitCollection.userInterfaceStyle == .dark
        } else {
            return false
        }
    }
}
