//
//  ViewController.swift
//  Homework_2.2
//
//  Created by Дарья Яровая on 20.05.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    private var rColor:CGFloat = 0.5
    private var gColor:CGFloat = 0.5
    private var bColor:CGFloat = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        // я так понимаю, что я могла просто в storyboard указать значение label, какой вариант правильней?
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        
        colorView.layer.cornerRadius = 30
        
        colorView.backgroundColor = UIColor(red: rColor, green: gColor, blue: bColor, alpha: 1)
    }

    @IBAction func changedSliderValue(_ sender: UISlider) {
        if  sender.accessibilityLabel == "red" {
            redValueLabel.text = String(format: "%.2f", sender.value)
            rColor = CGFloat(sender.value)
        } else if  sender.accessibilityLabel == "green" {
            greenValueLabel.text = String(format: "%.2f", sender.value)
            gColor = CGFloat(sender.value)
        } else if  sender.accessibilityLabel == "blue" {
            blueValueLabel.text = String(format: "%.2f", sender.value)
            bColor = CGFloat(sender.value)
        }
        updateViewBackgroundColor()
    }
    
    func updateViewBackgroundColor() {
        colorView.backgroundColor = UIColor(red: rColor, green: gColor, blue: bColor, alpha: 1)
    }
    
    
}

