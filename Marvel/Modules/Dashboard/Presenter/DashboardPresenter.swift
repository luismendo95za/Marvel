//
//  MDashboardPresenter.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import Foundation


protocol DashboardPresenterProtocol: class {
    func getListCharacter(limit: Int?, offset: Int?, name: String?, isPagination: Bool?)
}

class DashboardPresenter {
    
    var ui : DashboardViewControllerProtocol!
    var result: [CharacterModel] = []
    var service: DashboardService?
    
    init() {
        self.service = DashboardService()
    }
    
    func setView(view: DashboardViewControllerProtocol?) {
        self.ui = view
    }

}


extension DashboardPresenter: DashboardPresenterProtocol{
    func getListCharacter(limit: Int? = 20, offset: Int? = 0, name: String? = nil, isPagination: Bool? = false) {
        
        let loader = Loader()
        loader.showLoader(context: self.ui.context)
        service?.getCharactersList(limit: limit, offset: offset, name: name, completion: { response in
            if isPagination == true {
                self.ui.filteredData.append(contentsOf: response)
                self.ui.listCharacters.append(contentsOf: response)
            } else {
                self.ui.filteredData = response
                self.ui.listCharacters = response
            }
            self.ui.reloadTable()
            self.ui.refreshControl.endRefreshing()
            loader.hiddeLoader()
        }, failure: { error in
            loader.hiddeLoader()
            self.ui.reloadTable()
            self.ui.refreshControl.endRefreshing()
            ServerError.proccessError(error: error, context: self.ui.context)
        })
    }
}
