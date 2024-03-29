//
//  ToastStackView.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

#if os(iOS)

import UIKit

final class ToastStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .equalSpacing
        axis = .vertical
        alignment = .center
        spacing = 5
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#endif
