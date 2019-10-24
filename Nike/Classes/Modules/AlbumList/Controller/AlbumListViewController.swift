//
//  AlbumListViewController.swift
//  Nike
//
//  Created by David on 24/10/19.
//  Copyright © 2019 David. All rights reserved.
//
import UIKit

class AlbumListViewController: UIViewController {

    var tableView = UITableView()
    
    var viewModel = AlbumListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Albums"

        self.view.backgroundColor = UIColor.white

        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(AlbumListTableViewCell.self, forCellReuseIdentifier: "albumCell")
        self.viewModel.getAlbumList {
            self.tableView.reloadData()
        }
    }
    

}

extension AlbumListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.noOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as? AlbumListTableViewCell else {return UITableViewCell()}
        cell.album = self.viewModel.albumAtIndex(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension AlbumListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let detailController =  AlbumDetailViewController()
        detailController.selectedAlbum = self.viewModel.albumAtIndex(index: indexPath.row)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}

