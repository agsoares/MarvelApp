//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Adriano Soares on 01/02/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    var modelView = CharacterDetailViewModel()
    var character: CharacterModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelView.delegate = self
        if let character = self.character {
            modelView.character = character
    
        }
        
        // Do any additional setup after loading the view.
    }
}

extension CharacterDetailViewController: CharacterDetailViewModelDelegate {
    func didUpdateCharacterComics(character: CharacterModel) {
        
    }
    
}
