//
//  MainViewController.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 25.01.2023.
//

import UIKit
import Lottie

class MainViewController: UIViewController {

    private var menu = MenuView()

}
// MARK: Life-Cycle
extension MainViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightColor
        
        view.addSubview(menu)
        menu.translatesAutoresizingMaskIntoConstraints = false
        let menuConstraints = [
            menu.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 10),
            menu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            menu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            menu.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -110)
        ]
        NSLayoutConstraint.activate(menuConstraints)
    }
}
