//
//  AlbumListViewModel.swift
//  Nike
//
//  Created by David on 24/10/19.
//  Copyright © 2019 David. All rights reserved.
//
import UIKit

internal final class AlbumListViewModel {
    
    var albums:[Album] = []
    
    var albumService:AlbumListService = AlbumListService()
    
    init() {
    }
    
    func getAlbumList(completionHandler:@escaping (() -> ())) {
        self.albumService.getAlbumList([:]) {  (_ object:Feed?, _ error:String?) in
            if let feed = object, let feedItem = feed.feed, let results = feedItem.results {
                self.albums = results
            }
            completionHandler()
        }
    }
    
    var noOfRows:Int {
        return self.albums.count
    }
    
    func albumAtIndex(index:Int) -> Album {
        let contact = self.albums[index]
        return contact
    }
}
