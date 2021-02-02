//
//  UIKit+Extension.swift
//  Homework_5
//
//  Created by Sasha on 29/01/2021.
//

import UIKit

extension UIView {
    
    func addSubviewToFullScreen(_ view: UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)

        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
    
}
