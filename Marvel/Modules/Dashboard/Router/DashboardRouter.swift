//
//  DashboardRouter.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 31/5/21.
//

import Foundation


final class DashboardRouter {
    
    var ui : DashboardViewController!
    
    init(_ context: DashboardViewController) {
        ui = context
    }

    
    func navigateDetail(character: CharacterModel) {
        let detailVC = CharacterDetailViewController(nibName: "CharacterDetailViewController", bundle: nil)
        guard let characterId = character.id 
        else {
            return
        }
        detailVC.characterId = characterId
        self.ui.navigationController?.pushViewController(detailVC, animated: true)
    }
}
