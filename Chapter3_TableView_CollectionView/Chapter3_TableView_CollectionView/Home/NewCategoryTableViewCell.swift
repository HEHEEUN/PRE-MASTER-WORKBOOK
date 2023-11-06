//
//  NewCategoryTableViewCell.swift
//  Chapter3_TableView_CollectionView
//
//  Created by 김희은 on 11/7/23.
//

import UIKit

class NewCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLableView: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate : UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        productCollectionView.delegate = dataSourceDelegate
        productCollectionView.dataSource = dataSourceDelegate
        productCollectionView.tag = row
        //productCollectionView.isScrollEnabled = true
        
        
        let storyNib = UINib(nibName: "NewCategoryCollectionViewCell", bundle: nil)
        productCollectionView.register(storyNib, forCellWithReuseIdentifier: "NewCategoryCollectionViewCell")
        
        // 가로 스크롤만 가능하도록
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        //flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //flowLayout.minimumLineSpacing = 1.0
        
        productCollectionView?.reloadData()
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
