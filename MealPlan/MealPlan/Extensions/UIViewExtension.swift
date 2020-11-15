//
//  UIViewExtension.swift
//  MealPlan
//
//  Created by Adam Jessop on 15/11/2020.
//

import UIKit

extension UIView {
    
    func curveEdges(edges: CACornerMask?, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        if let edges = edges { self.layer.maskedCorners = edges }
    }
    
    func gradientBackground(firstColor: UIColor, secondColour: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColour.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
