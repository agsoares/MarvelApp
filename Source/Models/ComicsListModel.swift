//
//  ComicsListModel.swift
//  MarvelApp
//
//  Created by Adriano Soares on 01/02/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation
import ObjectMapper

class ComicsListModel: Mappable {
    var count: Int!
    var limit: Int!
    var offset: Int!
    var comics = [ComicsModel]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        count  <- map["data.total"]
        limit  <- map["data.limit"]
        offset <- map["data.offset"]
        comics <- map["data.results"]
    }
    
}
