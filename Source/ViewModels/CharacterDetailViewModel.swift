//
//  CharacterDetailViewModel.swift
//  MarvelApp
//
//  Created by Adriano Soares on 01/02/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation

class CharacterDetailViewModel {
    var api = MarvelAPI()
    
    var character: CharacterModel? {
        didSet {
            guard let character = character else {
                return
            }
            fetchCharacterComics(characterId: character.id)
        }
    }
    
    weak var delegate: CharacterDetailViewModelDelegate?
    
    fileprivate var isLoading = false
    
    func fetchCharacterComics(characterId: Int) {

    }
    
}

protocol CharacterDetailViewModelDelegate: class {
    func didUpdateCharacterComics (character: CharacterModel)
}
