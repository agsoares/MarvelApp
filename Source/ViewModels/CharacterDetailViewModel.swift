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
    var offset = 0
    
    var comics = [ComicsModel]()
    
    var character: CharacterModel? {
        didSet {
            fetchCharacterComics()
        }
    }
    
    weak var delegate: CharacterDetailViewModelDelegate?
    
    fileprivate var isLoading = false
    
    func fetchCharacterComics () {
        guard let characterId = character?.id else {
            return
        }
        if isLoading {
            return
        }
        isLoading = true
        api.fetchComics(characterId: characterId, offset: offset) { comicsList in
            self.offset = comicsList.offset + comicsList.limit
            self.comics.append(contentsOf: comicsList.comics)
            self.delegate?.didUpdateCharacterComics(comics: comicsList.comics)
            if (self.offset < comicsList.count ) {
                self.isLoading = false
            }
        }
    }
    
}

protocol CharacterDetailViewModelDelegate: class {
    func didUpdateCharacterComics (comics: [ComicsModel])
}
