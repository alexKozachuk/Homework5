//
//  NightCityViewController.swift
//  Homework_5
//
//  Created by Sasha on 30/01/2021.
//

import UIKit

class NightCityViewController: UIViewController {
    
    private var fireworkView: FireworkView?
    private var button: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setupGradientView()
        setupFireworkView()
        setupButton()
        setupImageView()
        
    }
    
}

private extension NightCityViewController {
    
    @objc func makeItSnowButtonTapped() {
        button?.isSelected.toggle()
        fireworkView?.isAnimate.toggle()
    }
    
    func setupGradientView() {
        let sky = GradientView()
        sky.colors = [#colorLiteral(red: 0, green: 0, blue: 0.0431372549, alpha: 1), #colorLiteral(red: 0.04705882353, green: 0.02745098039, blue: 0.5294117647, alpha: 1), #colorLiteral(red: 0.7882352941, green: 0.7843137255, blue: 0.9019607843, alpha: 1)]
        view.addSubviewToFullScreen(sky)
    }
    
    func setupFireworkView() {
        let fireworkView = FireworkView()
        fireworkView.particleImage = #imageLiteral(resourceName: "tspark")
        fireworkView.clipsToBounds = true
        self.fireworkView = fireworkView
        view.addSubviewToFullScreen(fireworkView)
    }
    
    func setupButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.setTitle("Make it Showy", for: .normal)
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
    
    func setupImageView() {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "seattle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
}
