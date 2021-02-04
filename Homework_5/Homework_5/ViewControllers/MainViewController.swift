//
//  ViewController.swift
//  Homework_5
//
//  Created by Sasha on 27/01/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var scrollView: UIScrollView!
    private var pages: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }

}

private extension MainViewController {
    
    func setupScrollView() {
        let page1 = createAndAddViewController(type: SnowViewController.self)
        let page2 = createAndAddViewController(type: ConfettiViewController.self)
        let page3 = createAndAddViewController(type: NightCityViewController.self)
        
        scrollView.isPagingEnabled = true
        scrollView.isDirectionalLockEnabled = true
        scrollView.delegate = self
        
        pages = [page1, page2, page3]
        let views: [String: UIView] = ["view": view, "page1": page1.view, "page2": page2.view, "page3": page3.view]
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[page1(==view)]|", options: [], metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[page1(==view)][page2(==view)][page3(==view)]|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: views)
        NSLayoutConstraint.activate( verticalConstraints + horizontalConstraints  )
    }
    
    func createAndAddViewController<T: UIViewController>(type: T.Type) -> UIViewController {
        
        let vc = T.init()
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(vc.view)
        addChild(vc)
        vc.didMove(toParent: self)
        
        return vc
    }
    
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y != 0 {
            scrollView.contentOffset.y = 0
        }
    }
    
}
