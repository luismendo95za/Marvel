//
//  Constants.swift
//  Marvel App
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//
import CryptoSwift
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
    static let ts = "0"
    static let apiKey = infoForKey("API KEY") ?? ""
    static let privateKey = infoForKey("PRIVATE KEY") ?? ""
    static let hash: String = (KeyParameter.ts + KeyParameter.privateKey + apiKey).md5()
    static let params: [String : Any] = ["ts" : KeyParameter.ts,
                                         "apikey": KeyParameter.apiKey ,
                                         "hash": KeyParameter.hash]
}

func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)
}
