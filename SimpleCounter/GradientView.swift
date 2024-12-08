//
//  GradientView.swift
//  SimpleCounter
//
//  Created by Кирилл Серебрянный on 08.12.2024.
//

import UIKit

class GradientView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemTeal.cgColor,
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds

        // Remove existing gradient layers to avoid duplicates
        self.layer.sublayers?.removeAll { $0 is CAGradientLayer }

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
