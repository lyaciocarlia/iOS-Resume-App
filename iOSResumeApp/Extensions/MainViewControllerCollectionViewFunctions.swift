//
//  MainViewControllerCollectionViewFunctions.swift
//  iOSResumeApp
//
//  Created by Iuliana Stecalovici  on 01.02.2023.
//

import Foundation
import UIKit

extension MainViewController{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == experienceCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExperienceCollectionViewCell.identifier, for:  indexPath ) as! ExperienceCollectionViewCell
            
            cell.view.configure(image: ExperienceCollectionViewCellData.image[indexPath.item]!,
                                label1: ExperienceCollectionViewCellData.label1[indexPath.item],
                                label2: ExperienceCollectionViewCellData.label2[indexPath.item],
                                label3: ExperienceCollectionViewCellData.label3[indexPath.item],
                                infoLabel: ExperienceCollectionViewCellData.info[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HobbyCollectionViewCell.identifier, for:  indexPath ) as! HobbyCollectionViewCell
            cell.image.image = ImageData.image[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == experienceCollectionView{
            return experienceCollectionViewNumberOfCells
        }
        return hobbyCollectionViewNumberOfCells
    }
}
