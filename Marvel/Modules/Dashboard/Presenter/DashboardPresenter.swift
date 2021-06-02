//
//  MDashboardPresenter.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import Foundation


protocol DashboardPresenterProtocol: class {
    func getListCharacter()
}

class DashboardPresenter {
    
    var ui : DashboardViewControllerProtocol!
    var result: [Result] = []
    var service: DashboardService?
    
    init() {
        self.service = DashboardService()
    }
    
    func setView(view: DashboardViewControllerProtocol?) {
        self.ui = view
    }

}


extension DashboardPresenter: DashboardPresenterProtocol{
    func getListCharacter() {
        
        let loader = Loader()
        loader.showLoader(context: self.ui.context)
        service?.getCharactersList(completion: { response in
            self.ui.listCharacters = response
            self.ui.filteredData = response
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
