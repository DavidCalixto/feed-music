//
//  AlbumDetailViewController.swift
//  Nike
//
//  Created by David on 24/10/19.
//  Copyright © 2019 David. All rights reserved.
//

import UIKit

class AlbumDetailViewController: UIViewController {

    var selectedAlbum : Album?
    
    let albumImageView:AsyncImageView = {
        let img = AsyncImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let artistNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let releaseDateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let copyrightLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    let redirectionButton:UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Click Here", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
    }
    
    func initializeUI(){
        self.view.backgroundColor = .white
        view.addSubview(redirectionButton)
        view.addSubview(albumImageView)
        view.addSubview(nameLabel)
        view.addSubview(artistNameLabel)
        view.addSubview(genreLabel)
        view.addSubview(releaseDateLabel)
        view.addSubview(copyrightLabel)
        
        redirectionButton.addTarget(self, action: #selector(AlbumDetailViewController.doAction), for: UIControl.Event.touchUpInside)
        
        updateConstraints()
    }
    
    func updateConstraints(){
        redirectionButton.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor, constant:20).isActive = true
        redirectionButton.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        redirectionButton.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant:-20).isActive = true
        redirectionButton.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        copyrightLabel.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor, constant:20).isActive = true
        copyrightLabel.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        copyrightLabel.bottomAnchor.constraint(equalTo:redirectionButton.topAnchor, constant:-10).isActive = true

        releaseDateLabel.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor, constant:20).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        releaseDateLabel.bottomAnchor.constraint(equalTo:copyrightLabel.topAnchor, constant:-10).isActive = true

        
        genreLabel.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor, constant:20).isActive = true
        genreLabel.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        genreLabel.bottomAnchor.constraint(equalTo:releaseDateLabel.topAnchor, constant:-10).isActive = true

        artistNameLabel.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor, constant:20).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo:genreLabel.topAnchor, constant:-10).isActive = true
        
        nameLabel.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor, constant:20).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo:artistNameLabel.topAnchor, constant:-10).isActive = true
        

        albumImageView.leadingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.leadingAnchor, constant:20).isActive = true
        albumImageView.trailingAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.trailingAnchor, constant:-20).isActive = true
        albumImageView.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant:20).isActive = true
        albumImageView.bottomAnchor.constraint(equalTo:nameLabel.topAnchor, constant:-20).isActive = true
     
        self.view.layoutIfNeeded()
        
        bindData()
    }
    
    func bindData(){
        guard let albumItem = selectedAlbum else {return}
        if let name = albumItem.name {
            nameLabel.text = name
        }
        if let imageURL = albumItem.artworkUrl100{
            albumImageView.loadAsyncFrom(url: imageURL, placeholder: nil)
        }
        if let artistName = albumItem.artistName {
            artistNameLabel.text = artistName
        }
        
        if let copyright = albumItem.copyright {
            copyrightLabel.text = copyright
        }

        if let releaseDate = albumItem.releaseDate {
            releaseDateLabel.text = releaseDate
        }
        
        var genresAvailable : [String] = []
        if let genres = albumItem.genres{
            for genre in genres {
                if let name = genre.name{
                    genresAvailable.append(name)
                }
            }
        }
        
        if genresAvailable.count > 0{
            genreLabel.text = genresAvailable.joined(separator: " | ")
        }

    }
    
    //Action : Button Click Event
    @objc func doAction() {
        guard let album = selectedAlbum, let link = album.url, let linkURL = URL(string: link) else {return}
        //Url will open only in device
        UIApplication.shared.open(linkURL, options:[:], completionHandler:nil)
    }
    
}
