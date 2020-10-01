//
//  ToastStackView.swift
//  KVKToast
//
//  Created by Sergei Kviatkovskii on 01.10.2020.
//

import UIKit

final class ToastStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        distribution = .fillProportionally
        axis = .vertical
        alignment = .center
        spacing = 15
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
