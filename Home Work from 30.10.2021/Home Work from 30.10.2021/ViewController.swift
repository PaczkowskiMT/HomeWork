//
//  ViewController.swift
//  Home Work from 30.10.2021
//
//  Created by Михаил on 1.11.21.
//

import UIKit

class ViewController: UIViewController {
    var myButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 100)
        myButton.setTitle("1", for: .normal)
        myButton.setTitle("1", for: .highlighted)
        private func configureLayout() {
            addSubview(myButton)
            NSLayoutConstraint.activate([
                myButton.centerXAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: 20)])
        }
        self.view.addSubview(myButton)
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 300, width: 100, height: 100)
        myButton.setTitle("2", for: .normal)
        myButton.setTitle("2", for: .highlighted)
        self.view.addSubview(myButton)
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 400, width: 100, height: 100)
        myButton.setTitle("+", for: .normal)
        myButton.setTitle("+", for: .highlighted)
        self.view.addSubview(myButton)
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 500, width: 100, height: 100)
        myButton.setTitle("=", for: .normal)
        myButton.setTitle("=", for: .highlighted)
        self.view.addSubview(myButton)
        // Do any additional setup after loading the view.
    }


}

