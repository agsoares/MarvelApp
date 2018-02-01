//
//  MarvelAPI.swift
//  MarvelApp
//
//  Created by Adriano Soares on 31/01/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import CryptoSwift

class MarvelAPI {
    let baseURL = "https://gateway.marvel.com:443"
    
    func fetchCharacters (offset: Int = 0, completionHandler: @escaping (CharacterListModel) -> ()) {
        var parameters = calcHash()
        
        parameters["offset"] = offset
        
        let url = baseURL + "/v1/public/characters"
        Alamofire
            .request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let characterList = Mapper<CharacterListModel>().map(JSONObject: value) {
                        completionHandler(characterList)
                    }
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    func fetchComics (characterId: Int, offset: Int = 0, completionHandler: @escaping (ComicsListModel) -> ()) {
        var parameters = calcHash()
        
        parameters["offset"] = offset
        
        let url = baseURL + "/v1/public/characters/\(characterId)/comics"
        Alamofire
            .request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    if let comicsList = Mapper<ComicsListModel>().map(JSONObject: value) {
                        completionHandler(comicsList)
                    }
                case .failure(let error):
                    print(error)
                }
                
        }
    }
    
    func calcHash () -> Parameters {
        let ts = Date().timeIntervalSince1970.description
        return [
            "ts"    : ts,
            "apikey": APIKeys.marvelPublicKey.rawValue,
            "hash"  : (ts+APIKeys.marvelPrivateKey.rawValue+APIKeys.marvelPublicKey.rawValue).md5()
        ]
    }
}
