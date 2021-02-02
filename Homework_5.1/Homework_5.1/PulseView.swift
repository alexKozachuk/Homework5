//
//  PulseView.swift
//  Homework_5.1
//
//  Created by Sasha on 31/01/2021.
//

import UIKit

final class PulseView: UIView {
    
    var isAnimate: Bool = false {
        didSet {
            if isAnimate {
                layers.forEach {
                    $0.isHidden = false
                    $0.removeAllAnimations()
                }
                addAnimatePulse(layers)
            } else {
                layers.forEach {
                    $0.isHidden = true
                    $0.removeAllAnimations()
                }
            }
            
        }
    }
    
    private var layers: [CAShapeLayer] = []
    
    override func layoutSubviews() {
        let circularPath = UIBezierPath(arcCenter: .zero, radius: frame.width / 2, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        
        for _ in 0..<3 {
            let pulseLayer = CAShapeLayer()
            pulseLayer.path = circularPath.cgPath
            pulseLayer.fillColor = UIColor.red.cgColor
            pulseLayer.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
            layer.addSublayer(pulseLayer)
            layers.append(pulseLayer)
        }
        
        isAnimate = false
    }
    
}

private extension PulseView {
    
    func makeScaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 1.0
        scaleAnimation.fromValue = 0.0
        scaleAnimation.toValue = 1.0
        return scaleAnimation
    }
    
    func makeOpacityAnimation() -> CABasicAnimation {
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.duration = 1.0
        fadeAnimation.fromValue = 1.0
        fadeAnimation.toValue = 0.0
        return fadeAnimation
    }
    
    func addAnimatePulse(_ layers: [CALayer]) {
        
        let count = layers.count
        
        for (index, layer) in layers.enumerated() {
            
            let animation = CAAnimationGroup()
            let fadeAnimation = makeOpacityAnimation()
            let scaleAnimation = makeScaleAnimation()
            animation.animations = [fadeAnimation, scaleAnimation]
            animation.duration = 1.0
            let beginTime = 0.1 + CFTimeInterval((animation.duration / Double(count)) * Double(index))
            animation.beginTime = beginTime
            animation.repeatCount = .greatestFiniteMagnitude
            
            layer.add(animation, forKey: "pulse")
            
        }
        
    }
    
}
