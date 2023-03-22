//
//  ViewController.swift
//  TrafficLight
//
//  Created by Рома Баранов on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var redSignal: UIView!
    @IBOutlet var yellowSignal: UIView!
    @IBOutlet var greenSignal: UIView!
    
    @IBOutlet var switchButton: UIButton!
    
    private var colorForComparison = CurrentLight.red
    private let contrastEnabled = 1
    private let contrastOff = 0.3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchButton.layer.cornerRadius = 10
        
        redSignal.alpha = contrastOff
        yellowSignal.alpha = contrastOff
        greenSignal.alpha = contrastOff
    }
    
    override func viewWillLayoutSubviews() {
        redSignal.layer.cornerRadius = redSignal.frame.width / 2
        yellowSignal.layer.cornerRadius = yellowSignal.frame.width / 2
        greenSignal.layer.cornerRadius = greenSignal.frame.width / 2
    }
    
    @IBAction func switchesColor(_ sender: UIButton) {
        if switchButton.currentTitle == "START" {
            switchButton.setTitle("NEXT", for: .normal)
        }
        
        switch colorForComparison {
        case .red:
            greenSignal.alpha = 0.3
            redSignal.alpha = 1
            colorForComparison = .yellow
        case .yellow:
            redSignal.alpha = 0.3
            yellowSignal.alpha = 1
            colorForComparison = .green
        case .green:
            yellowSignal.alpha = 0.3
            greenSignal.alpha = 1
            colorForComparison = .red
        }
    }
    
}

extension ViewController {
    enum CurrentLight {
        case red, yellow, green
    }
}
