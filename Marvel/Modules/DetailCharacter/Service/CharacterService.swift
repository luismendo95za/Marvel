//
//  CharacterService.swift
//  Marvel
//
//  Created by Luis Alberto Mendoza Reyna on 31/5/21.
//

import Foundation
import Alamofire

final class CharacterService {
    
    
    func getDetailCharacter(id: Int, completion: @escaping(CharacterModel)-> Void, failure: @escaping(AFError)-> Void) {
        
        let params = KeyParameter.params
        
        let request = AF.request(Endpoints.getDetailCharacter.replacingOccurrences(of: "{characterId}", with: "\(id)"), method: .get, parameters: params)
        
        request.responseJSON { detailCharacterResponse in
            
            switch detailCharacterResponse.result {
            case .success(_):
                if let json = (detailCharacterResponse.data) {
                    let decoder = JSONDecoder()
                    if let dataResponse = try? decoder.decode(RootModel.self, from: json) {
                        if let result = dataResponse.data?.results?.first {
                            completion(result)
                        } else {
                            failure(AFError.multipartEncodingFailed(reason: .bodyPartFileSizeNotAvailable(at: URL(fileURLWithPath: ""))))
                        }
                    }
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
}

