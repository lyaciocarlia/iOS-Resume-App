//
//  CustomView.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 31.01.2023.
//

import UIKit

class CustomView: UIView {
    
    private var image = UIImageView()
    private var label1 = UILabel()
    private var label2 = UILabel()
    private var label3 = UILabel()
    private var infoLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init? (coder: NSCoder) {
        super.init(coder: coder)
       setup()
    }
    
    func setup(){
        addSubview(image)
        image.layer.cornerRadius = cornerRadius
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        let imageViewConstraints = [
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: topSpacing),
            image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftSpacing),
            image.heightAnchor.constraint(equalToConstant: imageHeightWidth),
            image.widthAnchor.constraint(equalToConstant: imageHeightWidth)
        ]
        NSLayoutConstraint.activate(imageViewConstraints)
        
        label1.textAlignment = .left
        label1.textColor = .lightColor
        label1.font = .customViewTitleFont
        addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        let titleLabelConstraints = [
            label1.topAnchor.constraint(equalTo: self.topAnchor, constant: titleLabelTopAnchor),
            label1.leftAnchor.constraint(equalTo: image.rightAnchor, constant: distanceBetweenImageAndLabels),
            label1.heightAnchor.constraint(equalToConstant: titleLabelHeightAnchor),
            label1.widthAnchor.constraint(equalToConstant: titleLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)

        label2.textAlignment = .left
        label2.textColor = .lightColor
        label2.font = .defaultFont
        addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        let labeltwoConstraints = [
            label2.leftAnchor.constraint(equalTo: image.rightAnchor, constant: distanceBetweenImageAndLabels),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: distanceBetweenLabels),
            label2.widthAnchor.constraint(equalToConstant: labelWidthAnchor),
            label2.heightAnchor.constraint(equalToConstant: labelHeightAnchor) ]
        NSLayoutConstraint.activate(labeltwoConstraints)
        
        label3.textAlignment = .left
        label3.textColor = .lightColor
        label3.font = .defaultFont
        infoLabel.sizeToFit()
        addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        let labelthreeConstraints = [
            label3.leftAnchor.constraint(equalTo: image.rightAnchor, constant: distanceBetweenImageAndLabels),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: distanceBetweenLabels),
            label3.widthAnchor.constraint(equalToConstant: labelWidthAnchor),
            label3.heightAnchor.constraint(equalToConstant: labelHeightAnchor) ]
        NSLayoutConstraint.activate(labelthreeConstraints)
        
        infoLabel.textAlignment = .left
        infoLabel.textColor = .lightColor
        infoLabel.font = .defaultFont
        infoLabel.numberOfLines = infoLabelNumberOfLines    
        addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        let infoLabelConstraints = [
            infoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: leftSpacing),
            infoLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: distanceBetweenImageAndLabels),
            infoLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -leftSpacing ),
            infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: infoLabelBottomAnchor)]
        NSLayoutConstraint.activate(infoLabelConstraints)
    }
    
    func configure (image: UIImage, label1: UILabel, label2: UILabel, label3:UILabel, infoLabel: UILabel) {
        self.image.image = image
        self.label1 = label1
        self.label2 = label2
        self.label3 = label3
        self.infoLabel = infoLabel
        setup()
    }

}

