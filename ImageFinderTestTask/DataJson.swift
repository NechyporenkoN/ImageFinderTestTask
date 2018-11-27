//
//  DataJson.swift
//  ImageFinderTestTask
//
//  Created by Nikita Nechyporenko on 27.11.2018.
//  Copyright © 2018 Nikita Nechyporenko. All rights reserved.
//

import Foundation

struct DataJSON: Decodable {
    
    var data: [DataGif]
}

struct DataGif: Decodable {
    
    var images: Images
}

struct Images: Decodable {
    
    var original: Url
}

struct Url:Decodable {
    
    var url: String
}
