//
//  ToastStyle.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

public struct ToastStyle {
    
    public static let shared = ToastStyle()
    
    private init() {}
    
    public var backgroundColor: UIColor = {
        if #available(iOS 13.0, *) {
            return .systemGray6
        } else {
            return .lightGray
        }
    }()
    public var titleColor: UIColor = .darkGray
    public var messageColor: UIColor = .darkGray
    public var cornerRadius: CGFloat = 25
    public var titleFont: UIFont = .appFont(size: 17, weight: .semibold)
    public var messageFont: UIFont = .appFont(size: 17)
    public var titleAlignment: NSTextAlignment = .center
    public var messageAlignment: NSTextAlignment = .center
    public var titleNumberOfLines = 0
    public var messageNumberOfLines = 0
    public var imageSize = CGSize(width: 25, height: 25)
    public var minHeight: CGFloat = 50
    public var minWidth: CGFloat = 250
    public var followForSystemTheme: Bool = true
    public var blur: UIBlurEffect.Style = .light
    var isEnableHideWithGesture: Bool = true
    
}

extension ToastStyle {
    
    var actualStyle: ToastStyle {
        guard followForSystemTheme else { return self }
        
        var updatedStyle = self
        if #available(iOS 13, *) {
            updatedStyle.titleColor = UIColor.useColorForStyle(dark: .lightText, white: updatedStyle.titleColor)
            updatedStyle.messageColor = UIColor.useColorForStyle(dark: .lightText, white: updatedStyle.messageColor)
            updatedStyle.backgroundColor = UIColor.useColorForStyle(dark: .black, white: updatedStyle.backgroundColor)
        }
        updatedStyle.blur = UIScreen.isDarkMode ? .dark : .light
        
        return updatedStyle
    }
}

#endif
