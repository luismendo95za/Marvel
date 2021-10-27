//
//  Constants.swift
//  Marvel App
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import Foundation

enum Constants {
    static var baseUrl: String { "https://gateway.marvel.com/" }
    static var limitPage: Int = 20
}

enum Endpoints{
    static var listCharacter: String = Constants.baseUrl + "/v1/public/characters"
    static var getDetailCharacter: String = Constants.baseUrl + "/v1/public/characters/{characterId}"
}

struct KeyParameter {
    static let ts: String = "0"
    static let apiKey: String? = infoForKey("API KEY") ?? ""
    static let hash: String = "2529c87b340fd4e599d27ec7290cc3ce"
    
    static let params: [String : Any] = ["ts" : KeyParameter.ts,
                                         "apikey": KeyParameter.apiKey ?? "",
                                         "hash": KeyParameter.hash]
}

func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)
}
