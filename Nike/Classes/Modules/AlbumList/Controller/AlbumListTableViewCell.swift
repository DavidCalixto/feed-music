//
//  AlbumListTableViewCell.swift
//  Nike
//
//  Created by David on 24/10/19.
//  Copyright © 2019 David. All rights reserved.
//
import UIKit

class AlbumListTableViewCell: UITableViewCell {
    
    var album:Album? {
        didSet {
            guard let albumItem = album else {return}
            if let name = albumItem.name {
                nameLabel.text = name
            }
            if let imageURL = albumItem.artworkUrl100{
                profileImageView.loadAsyncFrom(url: imageURL, placeholder: nil)
            }
            if let artistName = albumItem.artistName {
                detailedLabel.text = " \(artistName) "
            }
        }
    }
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let profileImageView:AsyncImageView = {
        let img = AsyncImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(detailedLabel)
        self.contentView.addSubview(containerView)
        
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        detailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        detailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        detailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        detailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
}
