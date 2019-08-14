//
//  BeerCollectionViewCell.swift
//  APICollectionImage
//
//  Created by Thawatchai Phuchana on 14/8/2562 BE.
//  Copyright © 2562 Thawatchai Phuchana. All rights reserved.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var nameLabel : UILabel!
     @IBOutlet private var percentLabel : UILabel!
     @IBOutlet private var imageLabel : UIImageView!
   
    func setUpUI(beer : Beer)
    {
        nameLabel.text = beer.name
        percentLabel.text = "\(beer.abv)%"
        
    }
     
        

}
