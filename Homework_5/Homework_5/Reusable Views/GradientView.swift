//
//  GradientView.swift
//  Homework_5
//
//  Created by Sasha on 29/01/2021.
//

import UIKit

final class GradientView: UIView {
    
    var colors: [UIColor] = [UIColor.white,UIColor.white]
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = colors.map {$0.cgColor}
    }
    
}
