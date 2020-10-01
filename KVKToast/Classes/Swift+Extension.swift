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
