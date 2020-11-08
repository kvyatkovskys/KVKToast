//
//  Swift+Extension.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

import Foundation

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
}
