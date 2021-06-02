//
//  CharacterTableViewCell.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameCharacterLabel: UILabel!
    static var reuseId: String = "CharacterTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(character: Result) {
        self.nameCharacterLabel.text = character.name
    }
    
    
}
