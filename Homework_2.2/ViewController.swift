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
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    private var rColor:CGFloat = 0.5
    private var gColor:CGFloat = 0.5
    private var bColor:CGFloat = 0.5
    private var alphaColor:CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        redSlider.thumbTintColor = .red
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.thumbTintColor = .green
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.thumbTintColor = .blue
        
        alphaSlider.value = 1
        
        // я так понимаю, что я могла просто в storyboard указать значение label, какой вариант правильней?
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        alphaValueLabel.text = String(format: "%.2f", alphaSlider.value)
        
        colorView.layer.cornerRadius = 30
        
        colorView.backgroundColor = UIColor(red: rColor, green: gColor, blue: bColor, alpha: alphaColor)
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
        } else if sender.accessibilityLabel == "alpha" {
            alphaValueLabel.text = String(format: "%.2f", sender.value)
            alphaColor = CGFloat(sender.value)
        }
        updateViewBackgroundColor()
    }
    
    func updateViewBackgroundColor() {
        colorView.backgroundColor = UIColor(red: rColor, green: gColor, blue: bColor, alpha: alphaColor)
    }
    
    
}

