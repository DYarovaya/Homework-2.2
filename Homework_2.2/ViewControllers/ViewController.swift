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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        redSlider.thumbTintColor = .red
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.thumbTintColor = .green
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.thumbTintColor = .blue
        
        alphaSlider.value = 1
        

        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        alphaValueLabel.text = string(from: alphaSlider)
        
        colorView.layer.cornerRadius = 30
        
        setColor()
    }

    @IBAction func changedSliderValue(_ sender: UISlider) {
        setColor()
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        alphaValueLabel.text = string(from: alphaSlider)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(alphaSlider.value)
        )
    }
        
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}
