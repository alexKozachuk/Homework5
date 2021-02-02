//
//  FireworkView.swift
//  Homework_5
//
//  Created by Sasha on 31/01/2021.
//

import UIKit

final class FireworkView: UIView {
    
    var isAnimate: Bool = false {
        didSet {
            updateLayer()
        }
    }
    var particleImage: UIImage?

    private var emitter: CAEmitterLayer?
    
    override func layoutSubviews() {
        createEmmiter()
    }
    
    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
    
}

private extension FireworkView {
    
    func createEmmiter() {
        guard let emitter = self.layer as? CAEmitterLayer else { return }
        
        
        emitter.emitterShape = .point
        emitter.emitterPosition = CGPoint(x: center.x, y: frame.maxY)
        emitter.emitterSize = CGSize(width: 0.0, height: 0.0)
        emitter.emitterMode = .outline
        emitter.renderMode = .additive

        let containerCell = makeContainerCell()
        let trailCell = makeTrailCell()
        let fireworkCell = makeFireworkCell()

        containerCell.emitterCells = [trailCell, fireworkCell]

        emitter.emitterCells = [containerCell]
        self.emitter = emitter
        
        updateLayer()
    }
    
    func updateLayer() {
        emitter?.birthRate = isAnimate ? 1 : 0
    }
    
    func makeContainerCell() -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.birthRate = 1
        cell.lifetime = 2.5
        cell.velocity = 300.0
        cell.velocityRange = 60
        cell.yAcceleration = 60.0
        cell.emissionLongitude = -90.0 * (.pi / 180.0)
        cell.emissionRange = 25.0 * (.pi / 180.0)
        cell.spin = 10.0 * (.pi / 180.0)
        cell.scale = 0.0
        cell.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        cell.redRange = 0.9
        cell.greenRange = 0.9
        cell.blueRange = 0.9
        
        return cell
    }
    
    func makeTrailCell() -> CAEmitterCell {

        let cell = CAEmitterCell()
        cell.contents = particleImage?.cgImage
        cell.birthRate = 80.0
        cell.lifetime = 0.5
        cell.beginTime = 0.01
        cell.duration = 1.3
        cell.velocity = 140.0
        cell.velocityRange = 100.0
        cell.xAcceleration = 100.0
        cell.yAcceleration = 350.0
        cell.emissionLongitude = -360.0 * (.pi / 180.0)
        cell.emissionRange = 5 * (.pi / 180.0)
        cell.scale = 20
        cell.scaleSpeed = 1
        cell.alphaSpeed = -0.7
        cell.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        return cell
    }
    
    func makeFireworkCell() -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contents = particleImage?.cgImage
        cell.birthRate = 13000.0
        cell.lifetime = 13.0
        cell.beginTime = 1.3
        cell.duration = 0.05
        cell.velocity = 100.0
        cell.yAcceleration = 60.0
        cell.emissionRange = 360.0 * (.pi / 180.0)
        cell.spin = 124.6 * (.pi / 180.0)
        cell.scale = 20
        cell.scaleSpeed = 1
        cell.alphaSpeed = -2
        cell.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        return cell
    }
    
    
}
