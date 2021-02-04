//
//  ViewController.swift
//  Homework_5.1
//
//  Created by Sasha on 31/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var pulse: PulseView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonDidTapped(_ sender: Any?) {
        pulse.isAnimate = true
    }
    
    @IBAction func stopButtonDidTapped(_ sender: Any?) {
        pulse.isAnimate = false
    }
    
}

