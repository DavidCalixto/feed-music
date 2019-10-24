//
//  AlbumListService.swift
//  Nike
//
//  Created by David on 24/10/19.
//  Copyright © 2019 David. All rights reserved.
//
import UIKit
import Foundation

internal final class AlbumListService: APIResponseRepresentable {
    
    var networkClient:NetworkClient = NetworkClient()
    
    func getAlbumList<T: Codable>(_ params: [String:Any], requestCompletion: @escaping (_ object:T?,_ error: String?)->()){
        
        let request = URLRequest(url: URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json")!)
        self.networkClient.loadRequest(request) { data, response, error in
            
            self.handleResponse(responseData: data, urlResponse: response, errorObj: error, completionHandler: { (_ object:T?, _ error: String?) in
                
                requestCompletion(object,error)
            })
        }
    }
}
