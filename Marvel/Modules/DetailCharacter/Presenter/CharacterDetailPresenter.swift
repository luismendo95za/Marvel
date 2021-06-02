//
//  CharacterDetailPresenter.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 31/5/21.
//

import Foundation


protocol CharacterDetailPresenterProtocol: class {
    func getDetailCharacter(id: Int)
}

class CharacterDetailPresenter {
    
    var ui : CharacterDetailViewProtocol!
    let service: CharacterService?
    
    init() {
        self.service = CharacterService()
    }
    
    func setView(view: CharacterDetailViewProtocol?) {
        self.ui = view
    }
}


extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    
    
    func getDetailCharacter(id: Int) {
        
        let loader = Loader()
        loader.showLoader(context: self.ui.context)
        self.service?.getDetailCharacter(id: id, completion: { (character) in
            self.ui.reloadView(character: character)
            loader.hiddeLoader()
        }, failure: { (error) in
            loader.hiddeLoader()
            ServerError.proccessError(error: error, context: self.ui.context)
        })
    }
}
