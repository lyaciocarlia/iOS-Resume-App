//
//  ViewTitleLabel.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 31.01.2023.
//

import UIKit

class ViewTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textColor = .darkColor
        self.textAlignment = .left
        self.font = .mainViewConstrollerTitleLabelFont
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
