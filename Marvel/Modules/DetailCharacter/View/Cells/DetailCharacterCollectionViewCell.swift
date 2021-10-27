//
//  DetailCharacterCollectionViewCell.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 1/6/21.
//

import UIKit

class DetailCharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var comicImageView: UIImageView!
    @IBOutlet private weak var labelName: UILabel!
    static var reuseId = "DetailCharacterCollectionViewCell"
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(comicName: String) {
        labelName.text = comicName
    }
}
