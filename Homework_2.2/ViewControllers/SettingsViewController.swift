//
//  ViewController.swift
//  Homework_2.2
//
//  Created by Дарья Яровая on 20.05.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func update(rgbaColor: RGBAColor)
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var alphaValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    var rgbaColor: RGBAColor!
    
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.minimumTrackTintColor = .red
        redSlider.thumbTintColor = .red
        
        greenSlider.minimumTrackTintColor = .green
        greenSlider.thumbTintColor = .green
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.thumbTintColor = .blue
        
        alphaSlider.value = 1
        
        
        if let rgbaColor = rgbaColor {
            redSlider.value = rgbaColor.redColor
            greenSlider.value = rgbaColor.greenColor
            blueSlider.value = rgbaColor.blueColor
            alphaSlider.value = rgbaColor.alphaColor
            
            redValueLabel.text = String(rgbaColor.redColor)
            greenValueLabel.text = String(rgbaColor.greenColor)
            blueValueLabel.text = String(rgbaColor.blueColor)
            alphaValueLabel.text = String(rgbaColor.alphaColor)
        }
        
        colorView.layer.cornerRadius = 30
        
        setColor()
    }
    
    @IBAction func changedSliderValue(_ sender: UISlider) {
        
        setColor()
        
        rgbaColor = RGBAColor(
            redColor: Float(string(from: redSlider)) ?? 0,
            greenColor: Float(string(from: greenSlider)) ?? 0,
            blueColor: Float(string(from: blueSlider)) ?? 0,
            alphaColor: Float(string(from: alphaSlider)) ?? 0
        )
        
        redValueLabel.text = String(rgbaColor.redColor)
        greenValueLabel.text = String(rgbaColor.greenColor)
        blueValueLabel.text = String(rgbaColor.blueColor)
        alphaValueLabel.text = String(rgbaColor.alphaColor)
        
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
    
    @IBAction func doneButtonPressed() {
        delegate?.update(rgbaColor: rgbaColor)
        dismiss(animated: true)
    }
}
