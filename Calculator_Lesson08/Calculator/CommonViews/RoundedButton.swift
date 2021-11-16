//
//  AbstractCalculatorViewController.swift
//  Calculator
//
//  Created by Михаил on 15.11.21.
//

import UIKit

class RoundedButton: UIButton {
    func roundCorners() {
        layer.cornerRadius = frame.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundCorners()
    }
}
