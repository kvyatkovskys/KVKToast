//
//  ToastStyle.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

public struct ToastStyle {
    
    public init() {}
    
    public var backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.8)
    public var titleColor: UIColor = .white
    public var messageColor: UIColor = .white
    public var cornerRadius: CGFloat = 10
    public var titleFont: UIFont = .appFont(size: 17, weight: .bold)
    public var messageFont: UIFont = .appFont(size: 17)
    public var titleAlignment: NSTextAlignment = .center
    public var messageAlignment: NSTextAlignment = .center
    public var titleNumberOfLines = 0
    public var messageNumberOfLines = 0
    public var imageSize = CGSize(width: 30, height: 30)
    public var minHeight: CGFloat = 70
}

#endif
