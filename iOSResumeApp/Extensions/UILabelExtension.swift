//
//  UILabelExtension.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 25.01.2023.
//

import Foundation
import UIKit

extension UILabel {
    static func labelWithText (text: String) -> UILabel{
        let label = UILabel()
        label.text = text
        return label
    }
}
