//
//  ViewController.swift
//  Chapter3_TableView_CollectionView
//
//  Created by 김희은 on 10/17/23.
//

import UIKit

class HomeViewController: UIViewController {

    var productImgArray: [UIImage] = []
    
    let titles : Array<String> = ["[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^ - 🧅", "에어팟맥스실버", "에어팟 맥스 스페이스그레이 S급 판매합니다.", "[S급]에어팟 맥스 스페이스 그레이 판매합니다.", "보일러 온돌 (배관) 고쳐드려요", "포켓몬 스티커 팔아요"]
    let locationInfo : Array<String> = ["당근알바", "성남시 수정구", "성남시 수정구", "성남시 분당구", "성남시 수정구", "성남시 분당구"]
    let timeInfo = [". 이벤트", ". 6일 전", ". 3시간 전", ". 1일 전", ". 2주 전", ". 1시간 전"]
    let resrvInfo = [false, true, false, true, false, false]
    let priceInfo : Array<String> = ["", "370,000원", "490,000원", "가격 제안", "0원", "2,000원"]
    let chatInfo = [0, 5, 1, 2, 0, 0]
    let likedInfo = [0, 23, 4, 0, 0, 3]
    
    let newCategoryTitles : Array<String> = ["키친플라워 DW1201CP 얼음메이커", "얼음 트레이 소(얼음판)/개당 판매 천 원", "실리콘 얼음틀", "귀여운 얼음틀 팔아요! 아이스크림 용으로 딱", "동그라미 얼음틀 가져가세요", "조그만 얼음 만트는 얼음틀 팔아요", "빙수 기계 사가실 분"]
    let newCategoryPriceInfo = ["92,000원", "1,000원", "2,000원", "3,000원", "0원", "무료 나눔", "가격 제안"]
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // HomeTableViewCell을 Nib으로 등록하는 과정
        let homeNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(homeNib, forCellReuseIdentifier: "HomeTableViewCell")
        
        let storyNib = UINib(nibName: "NewCategoryTableViewCell", bundle: nil)
        homeTableView.register(storyNib, forCellReuseIdentifier: "NewCategoryTableViewCell")
        
        for index in 0...5 {
            let imageName = "product\(index)"
            if let image = UIImage(named: imageName) {
                productImgArray.append(image)
            } else {
                print("이미지 로드 실패, 대체 이미지 추가")
                let image = UIImage(named:"nothing")
                productImgArray.append(image!)
            }
        }
    }
    
}

// 코드가 길어질 경우, 가독성을 위해 extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // cell의 개수를 정해주는 함수
        let tableViewRows = titles.count
        //let tableViewRows = 6
        return tableViewRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // cell의 형식을 결정하는 함수
        //return UITableViewCell()
        //let cell = UITableViewCell()
        
        if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewCategoryTableViewCell", for: indexPath) as? NewCategoryTableViewCell else {
                return UITableViewCell() }
            
            
            return cell
        } else {
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.productImageView?.image = productImgArray[indexPath.row]
            cell.titleLabel?.text = titles[indexPath.row]
            cell.locationCategoryLabel?.text = locationInfo[indexPath.row]
            cell.timeLabel?.text = timeInfo[indexPath.row]
            cell.priceLabel?.text = priceInfo[indexPath.row]
            //cell.locationCategoryLabel?.text = locationInfo[indexPath.row]
            
            if !resrvInfo[indexPath.row] {
                cell.reservationLabel.isHidden = true
                // priceLabel의 레이아웃 위치 수정
                cell.priceLabel?.leftAnchor.constraint(equalTo: cell.reservationLabel.leftAnchor).isActive = true
            }
            
            if chatInfo[indexPath.row] == 0 {
                cell.chattingImageView.isHidden = true
                cell.chattingCountLabel.isHidden = true
            }
            else {
                cell.chattingCountLabel?.text = "\(chatInfo[indexPath.row])"
            }
            
            if likedInfo[indexPath.row] == 0 {
                cell.likedImageView.isHidden = true
                cell.likedCountLabel.isHidden = true
                //likedCountLabel 레이아웃 위치 수정
                cell.chattingCountLabel?.rightAnchor.constraint(equalTo: cell.likedCountLabel.rightAnchor).isActive = true
            }
            else {
                cell.likedCountLabel?.text = "\(likedInfo[indexPath.row])"
            }
            return cell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 230
        } else {
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewcell = cell as? NewCategoryTableViewCell else {
            return
        }
        tableViewcell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let collectionViewRows = newCategoryTitles.count
        //let tableViewRows = 6
        return collectionViewRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCategoryCollectionViewCell", for: indexPath) as? NewCategoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.productTitleLabel?.text = newCategoryTitles[indexPath.row]
        cell.categoryPriceLabel?.text = newCategoryPriceInfo[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 170)
    }
    //delegateFlowLayout이 collectionview와 tableview에서 만들어내는 차이점
    
}
