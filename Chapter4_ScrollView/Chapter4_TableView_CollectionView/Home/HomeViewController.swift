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
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // HomeTableViewCell을 Nib으로 등록하는 과정
        let homeNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(homeNib, forCellReuseIdentifier: "HomeTableViewCell")
        
        for index in 0...5 {
            var imageName = "product\(index)"
            if var image = UIImage(named: imageName) {
                productImgArray.append(image)
            } else {
                print("이미지 로드 실패, 대체 이미지 추가")
                var image = UIImage(named:"nothing")
                productImgArray.append(image!)
            }
        }
    }
    
}

// 코드가 길어질 경우, 가독성을 위해 extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // cell의 개수를 정해주는 함수
        let tableViewRows = titles.count
        return tableViewRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // cell의 형식을 결정하는 함수
        //return UITableViewCell()
        //let cell = UITableViewCell()
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
