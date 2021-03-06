//
//  ViewController.swift
//  Timer
//
//  Created by Sasha on 31/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var timeLabel: UILabel!
    private var shapeLayer: CAShapeLayer?
    private var timer: Timer?
    private var count: Double = 10
    private var maxCount: Double = 10
    private var isPaused: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimerView()
        setupTimerAnimation(with: maxCount)
    }

}

// MARK: Setup Methods

private extension ViewController {
    
    func setupTimerView() {
        
        let padding: CGFloat = 40
        let radius = (view.frame.width - (padding * 2)) / 2
        let center = CGPoint(x: timeLabel.frame.width / 2, y: timeLabel.frame.height / 2)
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 1.5, clockwise: true)
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.green.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 1
        
        self.shapeLayer = shapeLayer
                
        timeLabel.layer.addSublayer(shapeLayer)
        timeLabel.text = "\(Int(maxCount))"
    }
    
    func setupTimerAnimation(with duration: Double) {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
            
        let colorAnimation = CABasicAnimation(keyPath: "strokeColor")
        colorAnimation.toValue = UIColor.red.cgColor
            
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [basicAnimation, colorAnimation]
        groupAnimation.duration = CFTimeInterval(duration)
        groupAnimation.fillMode = .forwards
        groupAnimation.isRemovedOnCompletion = false
            
        shapeLayer?.add(groupAnimation, forKey: "timer")
        shapeLayer?.pause()
    }
    
}

// MARK: Timer Methods

private extension ViewController {
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        timer?.invalidate()
    }
    
    func resetTimer() {
        count = maxCount
        timer?.invalidate()
        timeLabel.text = "\(Int(maxCount))"
        
    }
    
    @objc func update() {
        if(count > 0) {
            count -= 0.1
            timeLabel.text = "\(Int(count.rounded(.up)))"
        } else {
            self.isPaused = true
            count = maxCount
            timer?.invalidate()
            timeIsUp()
        }
    }
    
    func timeIsUp() {
        let ac = UIAlertController(title: "Time is up", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.timeLabel.text = "\(Int(self.maxCount))"
            self.setupTimerAnimation(with: self.maxCount)
            self.timeLabel.alpha = 0.0
            UIView.animate(withDuration: 0.3) {
                self.timeLabel.alpha = 1.0
            }
        }
        ac.addAction(okAction)
        
        present(ac, animated: true)
    }
    
}

// MARK: Button Actions Methods

private extension ViewController {
    
    @IBAction func resumeButtonTapped() {
        guard isPaused else { return }
        isPaused.toggle()
        shapeLayer?.resume()
        runTimer()
    }
    
    @IBAction func pauseButtonTapped() {
        guard !isPaused else { return }
        isPaused.toggle()
        shapeLayer?.pause()
        pauseTimer()
    }
    
    @IBAction func resetButtonTapped() {
        isPaused = true
        shapeLayer?.removeAllAnimations()
        setupTimerAnimation(with: maxCount)
        resetTimer()
    }
    
    @IBAction func setButtonTapped() {
        
        let alertController = UIAlertController(title: "Timer", message: "Input time in seconds (in range [1-999])", preferredStyle: .alert)
        alertController.addTextField()
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            guard let stringItem = alertController.textFields?[0].text else { return }
            guard let intItem = Int(stringItem) else { return }
            guard intItem < 999 && intItem > 0 else { return }
            
            self?.maxCount = Double(intItem)
            self?.resetButtonTapped()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
}
