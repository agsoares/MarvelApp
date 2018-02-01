//
//  CharacterTableViewCell.swift
//  MarvelApp
//
//  Created by Adriano Soares on 01/02/18.
//  Copyright © 2018 Adriano Soares. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    var model: CharacterModel? {
        didSet {
            if let imagePath = model?.thumbnailUrl, let imageExtension = model?.thumbnailExtension {
                let  url = URL(string: imagePath + "." + imageExtension)
                characterImage.kf.indicatorType = .activity
                characterImage.kf.setImage(with: url)
                characterImage.contentMode = .scaleAspectFill
                
            }
            if let name = model?.name {
                characterName.text = name
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func layoutSubviews() {
        characterImage.layer.cornerRadius = characterImage.bounds.size.width/6
        characterImage.clipsToBounds = true
    }
    
}
