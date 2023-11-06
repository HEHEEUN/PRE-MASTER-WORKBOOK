//
//  NewCategoryCollectionViewCell.swift
//  Chapter3_TableView_CollectionView
//
//  Created by 김희은 on 11/7/23.
//

import UIKit

class NewCategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var categoryPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productTitleLabel.layer.cornerRadius = 5
        productImageView.layer.cornerRadius = 5
        
        productTitleLabel.clipsToBounds = true
        productImageView.clipsToBounds = true
    }

}
