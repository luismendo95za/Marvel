//
//  CharacterService.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 31/5/21.
//

import Foundation
import Alamofire

final class CharacterService {
    
    
    func getDetailCharacter(id: Int, completion: @escaping(Result)-> Void, failure: @escaping(AFError)-> Void) {
        
        let params = KeyParameter.params
        
        let request = AF.request(Endpoints.getDetailCharacter.replacingOccurrences(of: "{characterId}", with: "\(id)"), method: .get, parameters: params)
        
        request.responseJSON { detailCharacterResponse in
            
            switch detailCharacterResponse.result {
            case .success(let value):
                if let JSON = value as? [String : Any] {
                    let data = Datum(json: JSON["data"] as? [String : Any] ?? [:])
                    completion(data?.results.first ?? Result())
                }
            case .failure(let error):
                failure(error)    
            }
        }
    }
}

