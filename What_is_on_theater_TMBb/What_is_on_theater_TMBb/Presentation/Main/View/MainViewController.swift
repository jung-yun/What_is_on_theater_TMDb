//
//  ViewController.swift
//  What_is_on_theater_TMBb
//
//  Created by 조중윤 on 2022/03/07.
//

import UIKit

class MainViewController: UIViewController {
    private var dummyData = ["터미네이너", "러시아워", "중경삼림", "황비홍", "라라랜드"]
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
    }
    
    private func configureTableView() {
        self.movieTableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        self.movieTableView.dataSource = self
        self.movieTableView.delegate = self
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.movieTableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else { return UITableViewCell() }
        
        cell.configureWith(movieTitle: dummyData[indexPath.row])
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


