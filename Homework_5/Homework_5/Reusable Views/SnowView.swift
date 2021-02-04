//
//  ParticleView.swift
//  Homework_5
//
//  Created by Sasha on 29/01/2021.
//

import UIKit

final class SnowView: UIView {
    
    var isAnimate: Bool = false {
        didSet {
            updateLayer()
        }
    }
    
    var particleImage: UIImage?
    private var emitter: CAEmitterLayer?

    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
    
    override func layoutSubviews() {
        createEmmiter()
    }
    
}

private extension SnowView {
    
    func makeEmitterCell(color: UIColor, velocity: CGFloat, scale: CGFloat) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 10
        cell.lifetime = 20.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = velocity
        cell.velocityRange = velocity / 4
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 8
        cell.scale = scale
        cell.scaleRange = scale / 3

        cell.contents = particleImage?.cgImage
        return cell
    }
    
    func createEmmiter() {
        emitter = self.layer as? CAEmitterLayer

        emitter?.emitterShape = .line
        emitter?.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter?.emitterSize = CGSize(width: bounds.size.width, height: 1)

        let near = makeEmitterCell(color: UIColor(white: 1, alpha: 1), velocity: 100, scale: 0.3)
        let middle = makeEmitterCell(color: UIColor(white: 1, alpha: 0.66), velocity: 80, scale: 0.2)
        let far = makeEmitterCell(color: UIColor(white: 1, alpha: 0.33), velocity: 60, scale: 0.1)

        emitter?.emitterCells = [near, middle, far]
        
        updateLayer()
    }
    
    func updateLayer() {
        emitter?.birthRate = isAnimate ? 1 : 0
    }
    
}
