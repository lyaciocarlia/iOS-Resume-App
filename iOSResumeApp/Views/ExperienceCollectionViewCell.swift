//
//  ExperienceCollectionViewCell.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 01.02.2023.
//

import UIKit

class ExperienceCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ExperienceCollectionViewCell"
    
    var view = CustomView ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(view)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init? (coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        view.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
