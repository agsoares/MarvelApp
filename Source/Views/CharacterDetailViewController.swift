//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Adriano Soares on 01/02/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    var viewModel = CharacterDetailViewModel()
    var character: CharacterModel?
    var comics = [ComicsModel]()
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        if let character = self.character {
            viewModel.character = character
            if let imagePath = character.thumbnailUrl, let imageExt = character.thumbnailExtension {
                let imageUrl = URL(string: imagePath + "." + imageExt)
                characterImage.kf.indicatorType = .activity
                characterImage.kf.setImage(with: imageUrl)
            }
            title = character.name
            
        }
        tableView.dataSource = self
        tableView.delegate = self
        configureLayout()
        // Do any additional setup after loading the view.
    }
    
    func configureLayout() {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "comicsCell", for: indexPath)
        
        cell.textLabel?.text = comics[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == comics.count - 1) {
            viewModel.fetchCharacterComics()
        }
    }
}

extension CharacterDetailViewController: CharacterDetailViewModelDelegate {
    func didUpdateCharacterComics(comics: [ComicsModel]) {
        self.comics.append(contentsOf: comics)
        tableView.reloadData()
    }
    
}
