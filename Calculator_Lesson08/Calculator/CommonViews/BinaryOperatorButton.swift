//
//  AbstractCalculatorViewController.swift
//  Calculator
//
//  Created by Михаил on 15.11.21.
//

import UIKit

class BinaryOperatorButton: RoundedButton {
    let defaultColor = UIColor.systemOrange
    let selectedColor = UIColor.white
    

    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? selectedColor : defaultColor
        }
    }
}
