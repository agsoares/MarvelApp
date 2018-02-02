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
    var characters = [CharacterModel]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        count      <- map["data.total"]
        limit      <- map["data.limit"]
        offset     <- map["data.offset"]
        characters <- map["data.results"]
    }
    
}
