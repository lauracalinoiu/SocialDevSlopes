//
//  Post.swift
//  SocialDevSlopes
//
//  Created by Laura Calinoiu on 06/04/2017.
//  Copyright © 2017 Laura Calinoiu. All rights reserved.
//

import Foundation

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    
    var caption: String {
        return _caption ?? ""
    }
    
    var imageUrl: String {
        return _imageUrl ?? ""
    }
    
    var likes: Int {
        return _likes ?? 0
    }
    
    init(caption: String, imageUrl: String, likes: Int) {
        _caption = caption
        _imageUrl = imageUrl
        _likes = likes
    }
    
    init(postKey: String, postData: [String: Any]) {
        self._postKey = postKey
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
    }
}
