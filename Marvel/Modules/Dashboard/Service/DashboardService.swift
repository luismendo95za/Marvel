//
//  MDashboardService.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import Foundation
import Alamofire

final class DashboardService {

    /// Call Service for obtain list of comic characters
    /// - Parameters:
    ///   - limit: Limit the result set to the specified number of resources.
    ///   - offset: Skip the specified number of resources in the result set.
    /// - Returns: lists of comic characters
    func getCharactersList(limit: Int? = 20, offset: Int? = 0, name: String? = nil,
                           completion: @escaping([CharacterModel])-> Void, failure: @escaping(AFError)-> Void) {
        
        var params = KeyParameter.params        
        params["limit"] = limit
        params["offset"] = offset
        params["nameStartsWith"] = name
        
        let request = AF.request(Endpoints.listCharacter, method: .get, parameters: params)
        
        request.responseJSON { (response) in
            
            switch response.result {
            case .success(_):
                if let json = (response.data) {
                    let decoder = JSONDecoder()
                    if let listModel = try? decoder.decode(RootModel.self, from: json) {
                        completion(listModel.data?.results ?? [])
                    }
                }
            case .failure(let error):
                failure(error)                
            }
        }
    }
}
