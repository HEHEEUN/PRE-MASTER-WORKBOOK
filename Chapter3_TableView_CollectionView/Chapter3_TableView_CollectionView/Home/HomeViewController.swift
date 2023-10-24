//
//  ViewController.swift
//  Chapter3_TableView_CollectionView
//
//  Created by 김희은 on 10/17/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        // HomeTableViewCell을 Nib으로 등록하는 과정
        let homeNib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeTableView.register(homeNib, forCellReuseIdentifier: "HomeTableViewCell")
    }
    
}

// 코드가 길어질 경우, 가독성을 위해 extension
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // cell의 개수를 정해주는 함수
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // cell의 형식을 결정하는 함수
        //return UITableViewCell()
        //let cell = UITableViewCell()
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
