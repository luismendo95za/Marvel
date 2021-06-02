//
//  MDashboardService.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import Foundation
import Alamofire

final class DashboardService {


    func getCharactersList(completion: @escaping([Result])-> Void, failure: @escaping(AFError)-> Void) {
        
        let params = KeyParameter.params
        
        let request = AF.request(Endpoints.listCharacter, method: .get, parameters: params)
        
        request.responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                if let JSON = value as? [String : Any] {
                    let listModel = Datum(json: JSON["data"] as? [String : Any] ?? [:])
                    completion(listModel?.results ?? [])
                }
            case .failure(let error):
                failure(error)                
            }
        }
    }
}
