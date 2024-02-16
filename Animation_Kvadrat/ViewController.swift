//
//  ViewController.swift
//  Animation_Kvadrat
//
//  Created by Ian Baikuchukov on 16/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var rectangle: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 12
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rectangle)
        rectangle.frame = CGRect(
            x: view.frame.width / 2 - 50,
            y: view.frame.height / 2 - 50,
            width: 100,
            height: 100
        )
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(gesture)
    }
    
    @objc
    private func didTapView(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: view)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseIn) {
            self.rectangle.center = tapLocation
        }
        
        animateRotation(tapLocation: tapLocation)
    }
    
    private func animateRotation(tapLocation: CGPoint) {
        let coordinate = self.rectangle.frame.origin.x
        let angle: CGFloat = coordinate < tapLocation.x ? 30 : -30
        let angleInRadiants = angle / (180 / CGFloat(Double.pi))
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.2
        animation.fromValue = 0
        animation.toValue = angleInRadiants
        animation.autoreverses = true
        rectangle.layer.add(animation, forKey: animation.keyPath)
    }

}
