//
//  ViewController.swift
//  Calculator
//
//  Created by Nickolai Nikishin on 2.11.21.
//  Edited by Mihail on 09.11.21
//

import UIKit

enum BinaryOperand: Int {
    case multiply = 100 // умножить
    case divide = 101 // поделить
    case sum = 102 // сложить
    case substruct = 103 // вычесть
    
    static func buttonTitle() {
        
    }
}

enum UnaryOperand: Int {
    case equal = 200
    case percent = 201
    case invert = 202
}

class StoryboardedCalculatorViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var displayText: String = "0" {
        didSet {
            displayLabel.text = displayText
            
            if operand == nil {
                value1 = Double(displayText)
            } else {
                value2 = Double(displayText)
            }
            
            print("value1: \(value1 ?? -100), value2: \(value2 ?? -100)")
        }
    }
    
    var value1: Double?
    var value2: Double?
    var operand: BinaryOperand?
    var equalityVaue: String?
    var needToRestartTextLabel = false
    
    // MARK: - override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayText = "0"
    }
    
    // MARK: - IBActions
    
    @IBAction func unaryOperatorTapped(_ sender: UIButton) {
        updateDisplayText(with: String())
        
    }
    @IBAction func digitButtonTapped(_ digitButton: UIButton) {
        updateDisplayText(with: String(digitButton.tag))
    }
    
    @IBAction func binaryOperandButtonTapped(_ sender: BinaryOperatorButton) {
        guard let type = BinaryOperand(rawValue: sender.tag) else {
            print("unknown type")
            return
        }
        
        
        
        operand = type
        needToRestartTextLabel = true
    }
    
    // MARK: - Functions
    
    func updateDisplayText(with newText: String) {
        if displayText == "0" && newText == "0" {
            return
        }
        
        if displayText == "0" {
            displayText = newText
            return
        }
        
        if displayText.count >= 9 {
            return
        }
        
        if needToRestartTextLabel {
            displayText = newText
            needToRestartTextLabel = false
        } else {
            displayText += newText
        }
    }
    
    // MARK: - Claculator logic
    
    static func calculate(value1: Double, value2: Double, operand: BinaryOperand) -> Double {
        
        switch operand {
        case .multiply:
            return value1 * value2
        case .divide:
            return value1 / value2
        case .sum:
            return value1 + value2
        case .substruct:
            return value1 - value2
        }
    }

    func calculate(_ operand: UnaryOperand) {
        var result: Double = Double(displayText) ?? 0
        switch operand {
        case .equal:
            if let value1 = value1,
            let value2 = value2,
               let _ = self.operand {
            result = Self.calculate(value1: value1, value2: value2, operand: self.operand!)
            }
        case .percent:
            result = result / 100
        case .invert:
            result.negate()
        }
        displayText = String(result)
        needToRestartTextLabel = false
        self.operand = nill
    }
}


