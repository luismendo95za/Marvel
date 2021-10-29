//
//  CharacterTableViewCell.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import UIKit
import Kingfisher

class CharacterTableViewCell: UITableViewCell {
        
    @IBOutlet private weak var nameCharacterLabel: UILabel!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var viewContentShadow: UIView!
    
    // MARK: - Variables
    static var reuseId: String = "CharacterTableViewCell"
    static let cornerRadius: CGFloat = 12.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        characterImageView.layer.cornerRadius = characterImageView.frame.size.width / 2
        characterImageView.clipsToBounds = true
    }
    
    /// Shadow in cell
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.viewContentShadow.layer.cornerRadius = CharacterTableViewCell.cornerRadius
            self.viewContentShadow.layer.masksToBounds = true
            
            let bezierPath = UIBezierPath(roundedRect: self.viewContentShadow.bounds, cornerRadius: CharacterTableViewCell.cornerRadius)
            self.viewContentShadow.layer.shadowPath = bezierPath.cgPath
            self.viewContentShadow.layer.masksToBounds = false
            self.viewContentShadow.layer.shadowColor = UIColor.black.cgColor
            self.viewContentShadow.layer.shadowRadius = 3.0
            self.viewContentShadow.layer.shadowOffset = CGSize(width: 0, height: 3)
            self.viewContentShadow.layer.shadowOpacity = 0.3
        }
    }

    func configure(character: CharacterModel) {
        self.nameCharacterLabel.text = character.name?.uppercased()
        let imgURL: URL? = URL(string: character.image?.getPathImage() ?? "")
        self.characterImageView.kf.setImage(with: imgURL)
    }
    
    override func prepareForReuse() {
        self.characterImageView.image = nil
        self.nameCharacterLabel.text = ""
    }
}

