//
//  CharacterListViewController.swift
//  MarvelApp
//
//  Created by Adriano Soares on 31/01/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController, CharacterListViewModelDelegate {
    let viewModel = CharacterListViewModel()
    
    var characters = [CharacterModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.delegate = self
        viewModel.fetchCharacterList()

        configureLayout()
    }

    func configureLayout () {
        title = "Character List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func didUpdateCharacterList(list: [CharacterModel]) {
        characters.append(contentsOf: list) 
        tableView.reloadData()
    }

}

extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = characters[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == characters.count-1) {
            viewModel.fetchCharacterList()
        }
    }
    
}

