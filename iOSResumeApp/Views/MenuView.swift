//
//  MenuView.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 25.01.2023.
//

import UIKit
import Lottie

class MenuView: UIView {
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Stecalovici Iuliana"
        label.textColor = UIColor.lightColor
        label.font = UIFont.menuMainFont
        return label
    }()

    private lazy var functionLabel : UILabel = {
        let label = UILabel()
        label.text = "Junior iOS Dev"
        label.textColor = UIColor.lightColor
        label.font = UIFont.menuDetailFont
        return label
    }()

    private lazy var nameFunctionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var downloadButton = UIButton()
    
    private var linkedInButton = UIButton()
    
    private var gitHubButton = UIButton()
    
    private var animationView: LottieAnimationView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = menuViewCornerRadius
        self.backgroundColor = UIColor.darkColor
        
        self.addSubview(nameFunctionStackView)
        let nameFunctionStackViewConstraints = [
            nameFunctionStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: nameFunctionStackViewTopSpacing),
            nameFunctionStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: menuViewLeftSpacing),
            nameFunctionStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: menuViewRightSpacing),
            nameFunctionStackView.heightAnchor.constraint(equalToConstant: nameFunctionStackViewHeight)
        ]
        NSLayoutConstraint.activate(nameFunctionStackViewConstraints)
        
        nameFunctionStackView.addArrangedSubview(nameLabel)
        nameFunctionStackView.addArrangedSubview(functionLabel)
    
        
//        let lineView = UIView(frame: CGRect(x: menuViewLeftSpacing, y: 70, width: 200, height: 1.0))
        let lineView = UIView()
        self.addSubview(lineView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        let lineViewConstraints = [
            lineView.topAnchor.constraint(equalTo: nameFunctionStackView.bottomAnchor, constant: distanceBetweenLineAndStackView),
            lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: menuViewLeftSpacing),
            lineView.widthAnchor.constraint(equalToConstant: lineViewWidth),
            lineView.heightAnchor.constraint(equalToConstant: lineViewHeight)
        ]
        NSLayoutConstraint.activate(lineViewConstraints)
        
        lineView.layer.borderWidth = lineViewWidth
        lineView.layer.borderColor = UIColor.lightColor.cgColor
        
        
        var downloadButtonConfiguration = UIButton.Configuration.plain()
        downloadButtonConfiguration.imagePadding = buttonConfigurantionImagePadding
        downloadButton.configuration = downloadButtonConfiguration
        downloadButton.setTitle("Download", for: .normal)
        downloadButton.setImage(UIImage(named: "download")?.resizedImage(Size: CGSize(width: buttonImageHeightWidth, height: buttonImageHeightWidth)), for: .normal)
        downloadButton.setTitleColor(.lightColor, for: .normal)
        downloadButton.setTitleColor(.highlighted, for: .highlighted)
        
        
        
        self.addSubview(downloadButton)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        let downloadButtonConstraints = [
            downloadButton.topAnchor.constraint(equalTo: nameFunctionStackView.bottomAnchor, constant: menuViewDistanceBetweenViews),
            downloadButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: menuViewLeftSpacing),
            downloadButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ]
        NSLayoutConstraint.activate(downloadButtonConstraints)
        
        
        var linkedInButtonConfiguration = UIButton.Configuration.plain()
        linkedInButtonConfiguration.imagePadding = buttonConfigurantionImagePadding
        linkedInButton.configuration = linkedInButtonConfiguration
        linkedInButton.setTitle("LinkedIn", for: .normal)
        linkedInButton.setImage(UIImage(named: "linkedin")?.resizedImage(Size: CGSize(width: buttonImageHeightWidth, height: buttonImageHeightWidth)), for: .normal)
        linkedInButton.setTitleColor(.lightColor, for: .normal)
        linkedInButton.setTitleColor(.highlighted, for: .highlighted)
        
        
        
        self.addSubview(linkedInButton)
        linkedInButton.translatesAutoresizingMaskIntoConstraints = false
        let linkedInButtonConstraints = [
            linkedInButton.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: menuViewDistanceBetweenViews),
            linkedInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: menuViewLeftSpacing),
            linkedInButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ]
        NSLayoutConstraint.activate(linkedInButtonConstraints)
        
        
        var gitHubConfiguration = UIButton.Configuration.plain()
        gitHubConfiguration.imagePadding = buttonConfigurantionImagePadding
        gitHubButton.configuration = gitHubConfiguration
        gitHubButton.setTitle("GitHub", for: .normal)
        gitHubButton.setImage(UIImage(named: "github")?.resizedImage(Size: CGSize(width: buttonImageHeightWidth, height: buttonImageHeightWidth)), for: .normal)
        gitHubButton.setTitleColor(.lightColor, for: .normal)
        gitHubButton.setTitleColor(.highlighted, for: .highlighted)
        
        
        
        self.addSubview(gitHubButton)
        gitHubButton.translatesAutoresizingMaskIntoConstraints = false
        let gitHubButtonConstraints = [
            gitHubButton.topAnchor.constraint(equalTo: linkedInButton.bottomAnchor, constant: menuViewDistanceBetweenViews),
            gitHubButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: menuViewLeftSpacing),
            gitHubButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ]
        NSLayoutConstraint.activate(gitHubButtonConstraints)
        
        
        animationView = .init(name: "shapes")
        animationView!.frame = .zero
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = animationSpeed
        self.addSubview(animationView!)
        
        animationView!.translatesAutoresizingMaskIntoConstraints = false
        let animationViewConstraints = [
            animationView!.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -menuViewDistanceBetweenViews),
            animationView!.leftAnchor.constraint(equalTo: self.leftAnchor),
            animationView!.rightAnchor.constraint(equalTo: self.rightAnchor),
            animationView!.heightAnchor.constraint(equalToConstant: animationViewHeight)
        ]
        NSLayoutConstraint.activate(animationViewConstraints)
        animationView!.play()
        
    }
    
    required init? (coder: NSCoder) {
        super.init(coder: coder)
    }
}
