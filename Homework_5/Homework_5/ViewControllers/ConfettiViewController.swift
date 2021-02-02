//
//  ConfettiViewController.swift
//  Homework_5
//
//  Created by Sasha on 30/01/2021.
//

import UIKit

class ConfettiViewController: UIViewController {
    
    var confettiView: ConfettiView?
    var button: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientView()
        setupImageView()
        setupConfettiView()
        setupButton()
        setupLabel()
    }
    
    @objc func makeItSnowButtonTapped() {
        button?.isSelected.toggle()
        confettiView?.isAnimate.toggle()
    }
    
}

private extension ConfettiViewController {
    
    func setupLabel() {
        guard let button = button else { return }
        let label = UILabel()
        label.text = "Happy Birthday!"
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
        ])
    }
    
    func setupImageView() {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "birthday-cake")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -40),
        ])
    }
    
    func setupGradientView() {
        let sky = GradientView()
        sky.colors = [#colorLiteral(red: 0.5450980392, green: 0.8117647059, blue: 1, alpha: 1),#colorLiteral(red: 0.8, green: 0.9607843137, blue: 1, alpha: 1)]
        view.addSubviewToFullScreen(sky)
    }
    
    func setupConfettiView() {
        let confetti = ConfettiView(frame: view.frame)
        confetti.particleImage = #imageLiteral(resourceName: "confetti")
        confetti.clipsToBounds = true
        confettiView = confetti
        confetti.colors = [.blue, .red, .green]
        view.addSubviewToFullScreen(confetti)
    }
    
    func setupButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.setTitle("Make it Fan", for: .normal)
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

