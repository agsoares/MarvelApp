//
//  ComicModel.swift
//  MarvelApp
//
//  Created by Adriano Soares on 01/02/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation
import ObjectMapper

class ComicsModel: Mappable {
    var id: Int!
    var title: String!

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        title       <- map["title"]
    }
    
}
