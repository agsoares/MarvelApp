//
//  CharacterListViewModel.swift
//  MarvelApp
//
//  Created by Adriano Soares on 31/01/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    weak var delegate: CharacterListViewModelDelegate?
    var offset = 0
    var characterList = [CharacterModel]()
    
    
    
}

protocol CharacterListViewModelDelegate: class {
    func didUpdateCharacterList (list: [CharacterModel])
}
