//
//  MainViewController.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 25.01.2023.
//

import UIKit
import Lottie

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: MENU VIEW
    private var menu = MenuView()
    
    // MARK: MAIN VIEW
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(white: whiteClear, alpha: alphaClear)
        scrollView.contentSize = scrollViewContentSize
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .lightColor
        contentView.frame.size = scrollViewContentSize
        return contentView
    }()
    
    // MARK: SANDWICH BUTTON
    private var sandwichButton = UIButton()
    
    // MARK: ABOUT LABEL
    private var aboutLabel: ViewTitleLabel = {
        let label = ViewTitleLabel()
        label.text = "About"
        return label
    }()
    
    // MARK: GENERAL INFO VIEW
    private lazy var generalInfoView: CustomView = {
        let info = CustomView()
        info.configure(image: avatarImage,
                       label1: nameLabel,
                       label2: emailLabel,
                       label3: phoneLabel,
                       infoLabel: infoLabel)
        info.frame = .zero
        info.backgroundColor = .pink
        info.layer.cornerRadius = cornerRadius
        return info
    }()
    
    private lazy var avatarImage: UIImage = {
        let imageName = "Avatar"
        let image = UIImage(named: imageName)
        return image!
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Stecalovici Iuliana"
        return label
    }()
    
    private lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.text = "istecalovici@gmail.com"
        return label
    }()
    
    private lazy var phoneLabel : UILabel = {
        let label = UILabel()
        label.text = "Tel: 064567820"
        return label
    }()
        
    private lazy var infoLabel : UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return label
    }()
    
    // MARK: STUDIES LABEL
    private var studiesLabel : ViewTitleLabel = {
        let label = ViewTitleLabel()
        label.text = "Studies"
        return label
    }()
    
    // MARK: CEEF STUDIES VIEW
    private lazy var ceefStudiesView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkPurple
        view.layer.cornerRadius = cornerRadius
        return view
    }()
    
    private lazy var ceefStudiesLabel : UILabel = {
        let label = UILabel()
        label.text = "CE în Economie și Finanțe "
        label.textColor = .lightColor
        label.textAlignment = .left
        label.font = .studiesViewTitleFont
        label.numberOfLines = numberOfLines
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var ceefStudiesInfoLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .lightColor
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        label.font = .defaultFont
        label.numberOfLines = numberOfLines
        return label
    }()
    
    // MARK: SWIFT STUDIES VIEW
    private lazy var swiftStudiesView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightPurple
        view.layer.cornerRadius = cornerRadius
        return view
    }()
    
    private lazy var swiftStudiesLabel : UILabel = {
        let label = UILabel()
        label.text = "iOS Studies"
        label.textColor = .lightColor
        label.textAlignment = .left
        label.font = .studiesViewTitleFont
        label.numberOfLines = numberOfLines
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var swiftStudiesInfoLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .left
        label.textColor = .lightColor
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        label.font = .defaultFont
        label.numberOfLines = numberOfLines
        return label
    }()
    
    private var swiftLogoView: LottieAnimationView?
    
    // MARK: EXPERIENCE LABEL
    private var experienceLabel : ViewTitleLabel = {
        let label = ViewTitleLabel()
        label.text = "Experience"
        return label
    }()
    
    // MARK: EXPERIENCE VIEW
    private lazy var experienceView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = .pink
        return view
    }()
    
    internal var experienceCollectionView: UICollectionView?
    
    // MARK: SKILLS LABEL
    private var skillsLabel : ViewTitleLabel = {
        let label = ViewTitleLabel()
        label.text = "Skills"
        return label
    }()
    
    // MARK: SKILLS VIEW
    
    private lazy var skillsView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = .lightPurple
        return view
    }()
    
    private lazy var skillsHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .horizontal
        stackView.distribution  = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = skillsStackViewSpacing
        return stackView
    }()
    
    private lazy var firstSkillsVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing   = skillsStackViewSpacing
        return stackView
    }()
    
    private var skillone: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    private var skilltwo: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    private var skillthree: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    private var skillfour: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    private var skillfive: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•FGGGGGGGKJJANFNA")
        return label
    }()
    private var skillsix: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    
    private lazy var secondSkillsVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis  = .vertical
        stackView.distribution  = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = skillsStackViewSpacing
        return stackView
    }()
    
    private var skillseven: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•UiKit")
        return label
    }()
    private var skilleight: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•JJJJJJJJJJJJJJ")
        return label
    }()
    private var skillnine: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    private var skillten: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    private var skilleleven: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    private var skilltwelve: SkillsLabel = {
        let label = SkillsLabel()
        label.config(text: "•Swift")
        return label
    }()
    
    // MARK: HobbyLabel
    
    private lazy var hobbyLabel : ViewTitleLabel = {
        let label = ViewTitleLabel()
        label.text = "Hobbies"
        return label
    }()
    
    // MARK: HOBBY VIEW
        
        private var hobbyCollectionView: UICollectionView?
    
    private lazy var hobbyView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = cornerRadius
        view.backgroundColor = UIColor(rgb: 0x8136D8)
        return view
    }()
    
}
// MARK: LIFE - CYCLE
extension MainViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightColor
        view.clipsToBounds = true
        view.layer.cornerRadius = cornerRadius
        
        // MARK: MENU VIEW
        view.addSubview(menu)
        let menuConstraints = [
            menu.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: menuTopAnchor),
            menu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: menuBottomAnchor),
            menu.leftAnchor.constraint(equalTo: view.leftAnchor, constant: menuLeftAnchor),
            menu.rightAnchor.constraint(equalTo: view.rightAnchor, constant: menuRightAnchor)
        ]
        NSLayoutConstraint.activate(menuConstraints)
        
        // MARK: MAIN VIEW
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // MARK: SANDWICH BUTTON
        sandwichButton.setImage(UIImage(named: "menu"), for: .normal)
        sandwichButton.isUserInteractionEnabled = true
        sandwichButton.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        
        contentView.addSubview(sandwichButton)
        sandwichButton.translatesAutoresizingMaskIntoConstraints = false
        let sandwichButtonConstraints = [
            sandwichButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: sandwichButtonTopAnchor),
            sandwichButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: sandwichButtonHeightWidthAnchor),
            sandwichButton.heightAnchor.constraint(equalToConstant: sandwichButtonHeightWidthAnchor),
            sandwichButton.widthAnchor.constraint(equalToConstant: sandwichButtonHeightWidthAnchor)
        ]
        NSLayoutConstraint.activate(sandwichButtonConstraints)
        
        // MARK: ABOUT LABEL
        contentView.addSubview(aboutLabel)
        let aboutLabelConstraints = [
            aboutLabel.topAnchor.constraint(equalTo: sandwichButton.bottomAnchor, constant: distanceBetweenViews),
            aboutLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: titleLabelLeftAnchor),
            aboutLabel.heightAnchor.constraint(equalToConstant: titleLabelHeightAnchor),
            aboutLabel.widthAnchor.constraint(equalToConstant: titleLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(aboutLabelConstraints)
        
        // MARK: GENERAL INFO VIEW
        contentView.addSubview(generalInfoView)
        generalInfoView.translatesAutoresizingMaskIntoConstraints = false
        let generalInfoViewConstraints = [
            generalInfoView.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: distanceBetweenViews),
            generalInfoView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edgeSpacing),
            generalInfoView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -edgeSpacing),
            generalInfoView.heightAnchor.constraint(equalToConstant: heightInfoView)
        ]
        NSLayoutConstraint.activate(generalInfoViewConstraints)
        
        // MARK: STUDIES LABEL
        contentView.addSubview(studiesLabel)
        let studiesLabelConstraints = [
            studiesLabel.topAnchor.constraint(equalTo: generalInfoView.bottomAnchor, constant: distanceBetweenViews),
            studiesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: titleLabelLeftAnchor),
            studiesLabel.heightAnchor.constraint(equalToConstant: titleLabelHeightAnchor),
            studiesLabel.widthAnchor.constraint(equalToConstant: titleLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(studiesLabelConstraints)
        
        // MARK: SWIFT STUDIES VIEW
        contentView.addSubview(swiftStudiesView)
        swiftStudiesView.translatesAutoresizingMaskIntoConstraints = false
        let swiftStudiesViewConstraints = [
            swiftStudiesView.topAnchor.constraint(equalTo: studiesLabel.bottomAnchor, constant: distanceBetweenViews),
            swiftStudiesView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edgeSpacing),
            swiftStudiesView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -edgeSpacing),
            swiftStudiesView.heightAnchor.constraint(equalToConstant: studiesViewHeight)
        ]
        NSLayoutConstraint.activate(swiftStudiesViewConstraints)
        
        swiftStudiesView.addSubview(swiftStudiesLabel)
        swiftStudiesLabel.translatesAutoresizingMaskIntoConstraints = false
        let swiftStudiesLabelConstraints = [
            swiftStudiesLabel.topAnchor.constraint(equalTo: swiftStudiesView.topAnchor, constant: studiesViewTitleLabelTopAnchor),
            swiftStudiesLabel.leftAnchor.constraint(equalTo: swiftStudiesView.leftAnchor, constant: studiesViewLabelsEdgeAnchor),
            swiftStudiesLabel.heightAnchor.constraint(equalToConstant: studiesViewTitleLabelHeightAnchor),
            swiftStudiesLabel.rightAnchor.constraint(equalTo: swiftStudiesView.rightAnchor, constant: -studiesViewLabelsEdgeAnchor)
        ]
        NSLayoutConstraint.activate(swiftStudiesLabelConstraints)
        swiftStudiesLabel.sizeToFit()
        
        swiftStudiesView.addSubview(swiftStudiesInfoLabel)
        swiftStudiesInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        let swiftStudiesInfoLabelConstraints = [
            swiftStudiesInfoLabel.leftAnchor.constraint(equalTo: swiftStudiesView.leftAnchor, constant: studiesViewLabelsEdgeAnchor),
            swiftStudiesInfoLabel.topAnchor.constraint(equalTo: swiftStudiesLabel.bottomAnchor, constant: studiesViewLabelTopAnchor),
            swiftStudiesInfoLabel.rightAnchor.constraint(equalTo: swiftStudiesView.rightAnchor, constant: -studiesViewLabelsEdgeAnchor )]
        NSLayoutConstraint.activate(swiftStudiesInfoLabelConstraints)
        
        swiftLogoView = .init(name: "swiftlogo")
        swiftLogoView!.frame = .zero
        swiftLogoView!.contentMode = .scaleAspectFit
        swiftLogoView!.loopMode = .loop
        swiftLogoView!.animationSpeed = swiftLogoAnimationSpeed 
        swiftStudiesView.addSubview(swiftLogoView!)
        swiftLogoView!.play()
        
        swiftLogoView!.translatesAutoresizingMaskIntoConstraints = false
        let swiftLogoViewConstraints = [
            swiftLogoView!.bottomAnchor.constraint(equalTo: swiftStudiesView.bottomAnchor, constant: swiftLogoBottomRight),
            swiftLogoView!.rightAnchor.constraint(equalTo: swiftStudiesView.rightAnchor, constant: swiftLogoBottomRight),
            swiftLogoView!.heightAnchor.constraint(equalToConstant: swiftLogoWidthHeight),
            swiftLogoView!.widthAnchor.constraint(equalToConstant: swiftLogoWidthHeight)
        ]
        NSLayoutConstraint.activate(swiftLogoViewConstraints)
        
        // MARK: CEEF STUDIES VIEW
        contentView.addSubview(ceefStudiesView)
        ceefStudiesView.translatesAutoresizingMaskIntoConstraints = false
        let ceefStudiesViewConstraints = [
            ceefStudiesView.topAnchor.constraint(equalTo: swiftStudiesView.bottomAnchor, constant: distanceBetweenViews),
            ceefStudiesView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edgeSpacing),
            ceefStudiesView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -edgeSpacing),
            ceefStudiesView.heightAnchor.constraint(equalToConstant: studiesViewHeight - swiftLogoWidthHeight - swiftLogoBottomRight)
        ]
        NSLayoutConstraint.activate(ceefStudiesViewConstraints)
        
        ceefStudiesView.addSubview(ceefStudiesLabel)
        ceefStudiesLabel.translatesAutoresizingMaskIntoConstraints = false
        let ceefStudiesLabelConstraints = [
            ceefStudiesLabel.topAnchor.constraint(equalTo: ceefStudiesView.topAnchor, constant: studiesViewTitleLabelTopAnchor),
            ceefStudiesLabel.leftAnchor.constraint(equalTo: ceefStudiesView.leftAnchor, constant: studiesViewLabelsEdgeAnchor),
            ceefStudiesLabel.heightAnchor.constraint(equalToConstant: studiesViewTitleLabelHeightAnchor),
            ceefStudiesLabel.rightAnchor.constraint(equalTo: ceefStudiesView.rightAnchor, constant: -studiesViewLabelsEdgeAnchor)
        ]
        NSLayoutConstraint.activate(ceefStudiesLabelConstraints)
        ceefStudiesLabel.sizeToFit()
        
        ceefStudiesView.addSubview(ceefStudiesInfoLabel)
        ceefStudiesInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        let ceefStudiesInfoLabelConstraints = [
            ceefStudiesInfoLabel.leftAnchor.constraint(equalTo: ceefStudiesView.leftAnchor, constant: studiesViewLabelsEdgeAnchor),
            ceefStudiesInfoLabel.topAnchor.constraint(equalTo: ceefStudiesLabel.bottomAnchor, constant: studiesViewLabelTopAnchor),
            ceefStudiesInfoLabel.rightAnchor.constraint(equalTo: ceefStudiesView.rightAnchor, constant: -studiesViewLabelsEdgeAnchor ),
            ceefStudiesInfoLabel.bottomAnchor.constraint(equalTo: ceefStudiesView.bottomAnchor, constant: -studiesViewLabelsEdgeAnchor)]
        NSLayoutConstraint.activate(ceefStudiesInfoLabelConstraints)
        
        // MARK: EXPERIENCE LABEL
        contentView.addSubview(experienceLabel)
        let experienceLabelConstraints = [
            experienceLabel.topAnchor.constraint(equalTo: ceefStudiesView.bottomAnchor, constant: distanceBetweenViews),
            experienceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: titleLabelLeftAnchor),
            experienceLabel.heightAnchor.constraint(equalToConstant: titleLabelHeightAnchor),
            experienceLabel.widthAnchor.constraint(equalToConstant: titleLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(experienceLabelConstraints)
        
        // MARK: EXPERIENCE VIEW
        
        contentView.addSubview(experienceView)
        experienceView.translatesAutoresizingMaskIntoConstraints = false
        let experienceViewConstraints = [
            experienceView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: distanceBetweenViews),
            experienceView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edgeSpacing),
            experienceView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -edgeSpacing),
            experienceView.heightAnchor.constraint(equalToConstant: heightInfoView)
        ]
        NSLayoutConstraint.activate(experienceViewConstraints)
        
        let experienceCollectionViewLayout = UICollectionViewFlowLayout()
        experienceCollectionViewLayout.scrollDirection = .horizontal
        experienceCollectionViewLayout.itemSize = CGSize(width: widthInfoView , height: heightInfoView)
        
        experienceCollectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: experienceCollectionViewLayout)
        
        guard let experienceCollectionView = experienceCollectionView else {
            return
        }
        experienceCollectionView.register(ExperienceCollectionViewCell.self, forCellWithReuseIdentifier: ExperienceCollectionViewCell.identifier)
        experienceCollectionView.dataSource = self
        experienceCollectionView.delegate = self
        
        experienceView.addSubview(experienceCollectionView)
        experienceCollectionView.layer.cornerRadius = cornerRadius
        experienceCollectionView.backgroundColor = .pink
        experienceCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let experienceCollectionViewConstraints = [
            experienceCollectionView.topAnchor.constraint(equalTo: experienceView.topAnchor, constant: collectionViewTopLeftRightAnchor),
            experienceCollectionView.leftAnchor.constraint(equalTo: experienceView.leftAnchor, constant: collectionViewTopLeftRightAnchor),
            experienceCollectionView.rightAnchor.constraint(equalTo: experienceView.rightAnchor, constant: collectionViewTopLeftRightAnchor),
            experienceCollectionView.heightAnchor.constraint(equalToConstant: heightInfoView)
        ]
        NSLayoutConstraint.activate(experienceCollectionViewConstraints)
        
        // MARK: SKILLS LABEL
        contentView.addSubview(skillsLabel)
        let skillsLabelConstraints = [
            skillsLabel.topAnchor.constraint(equalTo: experienceView.bottomAnchor, constant: distanceBetweenViews),
            skillsLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: titleLabelLeftAnchor),
            skillsLabel.heightAnchor.constraint(equalToConstant: titleLabelHeightAnchor),
            skillsLabel.widthAnchor.constraint(equalToConstant: titleLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(skillsLabelConstraints)
        
        // MARK: SKILLS VIEW
        
        contentView.addSubview(skillsView)
        skillsView.translatesAutoresizingMaskIntoConstraints = false
        let skillsViewConstraints = [
            skillsView.topAnchor.constraint(equalTo: skillsLabel.bottomAnchor, constant: distanceBetweenViews),
            skillsView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edgeSpacing),
            skillsView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -edgeSpacing),
            skillsView.heightAnchor.constraint(equalToConstant: skillsViewHeightAnchor)
        ]
        NSLayoutConstraint.activate(skillsViewConstraints)
        
        skillsView.addSubview(skillsHorizontalStackView)
        skillsHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        skillsHorizontalStackView.centerXAnchor.constraint(equalTo: skillsView.centerXAnchor).isActive = true
        skillsHorizontalStackView.centerYAnchor.constraint(equalTo: skillsView.centerYAnchor).isActive = true

        skillsHorizontalStackView.addArrangedSubview(firstSkillsVerticalStackView)
        skillsHorizontalStackView.addArrangedSubview(secondSkillsVerticalStackView)

        firstSkillsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        firstSkillsVerticalStackView.leftAnchor.constraint(equalTo: skillsView.leftAnchor, constant: skillsStackViewTopLeft).isActive = true
        firstSkillsVerticalStackView.topAnchor.constraint(equalTo: skillsView.topAnchor, constant: skillsStackViewTopLeft).isActive = true
        
        firstSkillsVerticalStackView.addArrangedSubview(skillone)
        firstSkillsVerticalStackView.addArrangedSubview(skilltwo)
        firstSkillsVerticalStackView.addArrangedSubview(skillthree)
        firstSkillsVerticalStackView.addArrangedSubview(skillfour)
        firstSkillsVerticalStackView.addArrangedSubview(skillfive)
        firstSkillsVerticalStackView.addArrangedSubview(skillsix)
        
        secondSkillsVerticalStackView.rightAnchor.constraint(equalTo: skillsView.rightAnchor, constant: -skillsStackViewTopLeft).isActive = true
        secondSkillsVerticalStackView.topAnchor.constraint(equalTo: skillsView.topAnchor, constant: skillsStackViewTopLeft).isActive = true
        
        secondSkillsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        secondSkillsVerticalStackView.addArrangedSubview(skillseven)
        secondSkillsVerticalStackView.addArrangedSubview(skilleight)
        secondSkillsVerticalStackView.addArrangedSubview(skillnine)
        secondSkillsVerticalStackView.addArrangedSubview(skillten)
        secondSkillsVerticalStackView.addArrangedSubview(skilleleven)
        secondSkillsVerticalStackView.addArrangedSubview(skilltwelve)
        
        // MARK: HOBBY LABEL
        
        contentView.addSubview(hobbyLabel)
        let hobbyLabelConstraints = [
            hobbyLabel.topAnchor.constraint(equalTo: skillsView.bottomAnchor, constant: distanceBetweenViews),
            hobbyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: titleLabelLeftAnchor),
            hobbyLabel.heightAnchor.constraint(equalToConstant: titleLabelHeightAnchor),
            hobbyLabel.widthAnchor.constraint(equalToConstant: titleLabelWidthAnchor)
        ]
        NSLayoutConstraint.activate(hobbyLabelConstraints)
        
        // MARK: Hobby
        
        contentView.addSubview(hobbyView)
        hobbyView.translatesAutoresizingMaskIntoConstraints = false
        let hobbyViewConstraints = [
            hobbyView.topAnchor.constraint(equalTo: hobbyLabel.bottomAnchor, constant: distanceBetweenViews),
            hobbyView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: edgeSpacing),
            hobbyView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -edgeSpacing),
            hobbyView.heightAnchor.constraint(equalToConstant: hobbyViewHeightAnchor)
        ]
        NSLayoutConstraint.activate(hobbyViewConstraints)
        
        
        let hobbyCollectionViewLayout = UICollectionViewFlowLayout()
        hobbyCollectionViewLayout.scrollDirection = .horizontal
        hobbyCollectionViewLayout.itemSize = CGSize(width: hobbyViewHeightAnchor, height: hobbyViewHeightAnchor)
        
        hobbyCollectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: hobbyCollectionViewLayout)
        guard let hobbyCollectionView = hobbyCollectionView else {
            return
        }
        hobbyCollectionView.register(HobbyCollectionViewCell.self, forCellWithReuseIdentifier: HobbyCollectionViewCell.identifier)
        hobbyCollectionView.dataSource = self
        hobbyCollectionView.delegate = self
        
        hobbyView.addSubview(hobbyCollectionView)
        hobbyCollectionView.backgroundColor = .lightColor
        hobbyCollectionView.layer.cornerRadius = cornerRadius
        hobbyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let hobbyCollectionViewConstraints = [
            hobbyCollectionView.topAnchor.constraint(equalTo: hobbyView.topAnchor, constant: collectionViewTopLeftRightAnchor),
            hobbyCollectionView.leftAnchor.constraint(equalTo: hobbyView.leftAnchor, constant: collectionViewTopLeftRightAnchor),
            hobbyCollectionView.rightAnchor.constraint(equalTo: hobbyView.rightAnchor, constant: collectionViewTopLeftRightAnchor),
            hobbyCollectionView.heightAnchor.constraint(equalToConstant: hobbyViewHeightAnchor)
        ]
        NSLayoutConstraint.activate(hobbyCollectionViewConstraints)
    }
}


// MARK: SHOW MENU FUNC
extension MainViewController{
    @objc func showMenu() {
        self.scrollView.layer.cornerRadius = cornerRadius
        self.scrollView.layer.cornerRadius = cornerRadius
        let x = view.frame.width * xAmplification   
        let originalTransform = self.scrollView.transform
        let scaledTransform = originalTransform.scaledBy (x: scaleTransform, y: scaleTransform)
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: yTransform)
        UIView.animate (withDuration: sandwichButtonAnimationDuration)
        {
            self.scrollView.transform = scaledAndTranslatedTransform
            self.sandwichButton.isHidden = true
        }
    }
}
