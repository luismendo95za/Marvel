//
//  CharacterDetailViewController.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 31/5/21.
//

import UIKit


protocol CharacterDetailViewProtocol: class {
    var character: Result? {get set}
    var context: CharacterDetailViewController? {get set}
    func reloadView(character: Result)
}

class CharacterDetailViewController: UIViewController {

    let presenter: CharacterDetailPresenter! = CharacterDetailPresenter()
    internal var character: Result? = nil
    var characterId: Int = 0
    var listComicsCharacter: [AnyObject] = []
    var context: CharacterDetailViewController?
    
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var labelDescriptionInform: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePresenter()
        configureCollection()
        self.presenter.getDetailCharacter(id: characterId)
        self.title = ""
    }
    
    fileprivate func configurePresenter() {
        self.presenter.setView(view: self)
        self.context = self
    }
    
    fileprivate func configureCollection() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "DetailCharacterCollectionViewCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: DetailCharacterCollectionViewCell.reuseId)
    }
}



extension CharacterDetailViewController: CharacterDetailViewProtocol {

    func reloadView(character: Result) {
        self.title = character.name
        self.labelDescriptionInform.text = "Descripción:" 
        self.descriptionLabel.text = character.descriptionField != "" ? character.descriptionField : "Sin descripción"
        listComicsCharacter = character.comics.items
        let urlImage = URL(string: character.thumbnail.absolutePath ?? "")
        characterImageView.kf.setImage(with: urlImage)
        self.collectionView.reloadData()
    }
}


extension CharacterDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listComicsCharacter.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCharacterCollectionViewCell.reuseId, for: indexPath) as! DetailCharacterCollectionViewCell
            
        cell.configure(comicName: listComicsCharacter[indexPath.row]["name"] as? String ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2, height: collectionView.frame.height)
    }
    
}
