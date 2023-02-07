//
//  HobbyCollectionViewCell.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 01.02.2023.
//

import UIKit

class HobbyCollectionViewCell: UICollectionViewCell {
    static let identifier = "HobbyCollectionViewCell"
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(image)
        contentView.backgroundColor = .darkPurple
        image.clipsToBounds = true
        
    }
    
    required init? (coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image.frame = CGRect(x: xAndY, y: xAndY, width: contentView.frame.size.width - (2 * xAndY), height: contentView.frame.size.height - (2 * xAndY))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
    }
}
