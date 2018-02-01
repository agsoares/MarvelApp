//
//  CharacterModel.swift
//  MarvelApp
//
//  Created by Adriano Soares on 31/01/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation
import ObjectMapper


class CharacterModel: Mappable {
    var id: Int!
    var name: String!
    var description: String?
    var thumbnailUrl: String?
    var thumbnailExtension: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        description <- map["description"]
        
        thumbnailUrl       <- map["thumbnail.path"]
        thumbnailExtension <- map["thumbnail.extension"]
    }
}
