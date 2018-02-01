//
//  CharacterListViewModel.swift
//  MarvelApp
//
//  Created by Adriano Soares on 31/01/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    var api = MarvelAPI()
    
    weak var delegate: CharacterListViewModelDelegate?
    var offset = 0
    var characters = [CharacterModel]()
    
    fileprivate var isLoading = false
    
    func fetchCharacterList () {
        if isLoading {
            return
        }
        isLoading = true
        api.fetchCharacters(offset: offset) { characterList in
            self.offset = characterList.offset + characterList.limit
            self.characters.append(contentsOf: characterList.characters)
            self.delegate?.didUpdateCharacterList(list: characterList.characters)
            self.isLoading = false
        }
    }
    
}

protocol CharacterListViewModelDelegate: class {
    func didUpdateCharacterList (list: [CharacterModel])
}
