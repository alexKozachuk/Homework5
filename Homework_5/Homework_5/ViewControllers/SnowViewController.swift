//
//  SnowViewController.swift
//  Homework_5
//
//  Created by Sasha on 29/01/2021.
//

import UIKit

class SnowViewController: UIViewController {
    
    private var snowView: SnowView?
    private var button: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientView()
        setupSnowView()
        setupButton()
        
    }
    
}

private extension SnowViewController {
    
    @objc func makeItSnowButtonTapped() {
        button?.isSelected.toggle()
        snowView?.isAnimate.toggle()
    }
    
    func setupGradientView() {
        let sky = GradientView()
        sky.colors = [#colorLiteral(red: 0.1333333333, green: 0.2745098039, blue: 0.5176470588, alpha: 1), #colorLiteral(red: 0.7568627451, green: 0.8, blue: 0.9019607843, alpha: 1)]
        view.addSubviewToFullScreen(sky)
    }
    
    func setupSnowView() {
        let snow = SnowView()
        snow.particleImage = #imageLiteral(resourceName: "snow-particle")
        snow.clipsToBounds = true
        snowView = snow
        view.addSubviewToFullScreen(snow)
    }
    
    func setupButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.setTitle("Make it Snow", for: .normal)
        button.setTitleColor(UIColor.green, for: .normal)
        button.setTitleColor(UIColor.red, for: .selected)
        button.setTitle("Make it Stop", for: .selected)
        button.addTarget(self, action: #selector(makeItSnowButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.button = button
        view.addSubview(button)
        
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            button.widthAnchor.constraint(equalToConstant: 130),
        ])
    }
    
}
