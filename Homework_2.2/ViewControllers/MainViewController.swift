//
//  mainViewController.swift
//  Homework_2.2
//
//  Created by Дарья Яровая on 05.06.2021.
//

import UIKit

class MainViewController: UIViewController {
    var rgbaColor = RGBAColor(redColor: 0, greenColor: 0, blueColor: 0, alphaColor: 1) {
        didSet {
            view.backgroundColor = UIColor(
                red: CGFloat(rgbaColor.redColor),
                green: CGFloat(rgbaColor.greenColor),
                blue: CGFloat(rgbaColor.blueColor),
                alpha: CGFloat(rgbaColor.alphaColor)
            )
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: CGFloat(rgbaColor.redColor),
            green: CGFloat(rgbaColor.greenColor),
            blue: CGFloat(rgbaColor.blueColor),
            alpha: CGFloat(rgbaColor.alphaColor)
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {
            return
        }
        settingsVC.rgbaColor = rgbaColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func update(rgbaColor: RGBAColor) {
        self.rgbaColor = rgbaColor
    }
}
