//
//  SkillsLabel.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 31.01.2023.
//

import UIKit

class SkillsLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.textColor = .lightColor
        self.font = .defaultFont
    }
    func config(text: String){
        self.text = text
    }
    
}
