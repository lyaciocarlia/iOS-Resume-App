//
//  ExperienceCollectionViewCellData.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 01.02.2023.
//

import Foundation
import UIKit

struct ExperienceCollectionViewCellData{
    static let image = [
        UIImage(named: "stepit"),
        UIImage(named: "tekedu"),
        UIImage(named: "aiesec")
    ]
    static let label1 = [
        UILabel.labelWithText(text: "Lector practician"),
        UILabel.labelWithText(text: "Project Manager"),
        UILabel.labelWithText(text: "Volunteer")
    ]
    static let label2 = [
        UILabel.labelWithText(text: "Step IT Academy"),
        UILabel.labelWithText(text: "Tekedu"),
        UILabel.labelWithText(text: "AIESEC in Chisinau")
    ]
    static let label3 = [
        UILabel.labelWithText(text: "september 2021 - present"),
        UILabel.labelWithText(text: "august - december 2021"),
        UILabel.labelWithText(text: "oct 2021 - febr 2022")
    ]
    static let info = [
        UILabel.labelWithText(text: "For a year and a half I worked with over 100 children and helped them better understand technologies such as HTML, Python, Photoshop, Illustrator, Scratch and others."),
        UILabel.labelWithText(text: "As part of the PRACTIC project, in partnership with UNFPA and Crunchyroll, I organized mentorship sessions with 15 young people on topics such as career guidance and gender equality."),
        UILabel.labelWithText(text: "I participated in the organization of the event “Leadership Done Right”  as the Organizing Committee Vice President of PR and worked in the MKT & PR department.")
    ]
}

