//
//  CharacterListModel.swift
//  MarvelApp
//
//  Created by Adriano Soares on 31/01/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation
import ObjectMapper

class CharacterListModel: Mappable {
    var count: Int!
    var limit: Int!
    var offset: Int!
    var characterList: [CharacterModel]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        count   <- map["data.count"]
        limit   <- map["data.limit"]
        offset  <- map["data.offset"]
        characterList <- map["data.results"]
    }
    
}