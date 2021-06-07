//
//  mainViewController.swift
//  Homework_2.2
//
//  Created by Дарья Яровая on 05.06.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else {
            return
        }
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func update(_ color: UIColor) {
        view.backgroundColor = color
    }
}
