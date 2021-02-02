//
//  ConfettiView.swift
//  Homework_5
//
//  Created by Sasha on 30/01/2021.
//

import UIKit

final class ConfettiView: UIView {
    
    var isAnimate: Bool = false {
        didSet {
            updateLayer()
        }
    }
    
    var particleImage: UIImage?
    var colors: [UIColor]?

    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
    
    private var emitter: CAEmitterLayer?
    
    override func layoutSubviews() {
        createEmmiter()
    }
    
}

private extension ConfettiView {
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 3
        cell.lifetime = 14.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 200
        cell.velocityRange = 0
        cell.emissionLongitude = CGFloat(Double.pi)
        cell.emissionRange = 0.5
        cell.spin = 3.5
        cell.spinRange = 0
        cell.scaleRange = 0.25
        cell.scale = 0.5
        cell.contents = particleImage?.cgImage
        
        return cell
    }
    
    func createEmmiter() {
        emitter = self.layer as? CAEmitterLayer

        emitter?.emitterShape = .line
        emitter?.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter?.emitterSize = CGSize(width: bounds.size.width, height: 1)

        var emmiterCells: [CAEmitterCell] = []
        
        
        colors?.forEach { item in
            let cell = makeEmitterCell(color: item)
            emmiterCells.append(cell)
        }

        emitter?.emitterCells = emmiterCells
        
        updateLayer()
    }
    
    func updateLayer() {
        emitter?.birthRate = isAnimate ? 1 : 0
    }
    
}
