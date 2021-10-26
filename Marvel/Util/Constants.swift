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


// My public key and private key + hash, encrypt .md5
struct KeyParameter {
    static let ts: String = "0"
    static let apikey: String = "816386c081ee7874b3d8c6e93b7977b0"
    static let hash: String = "2529c87b340fd4e599d27ec7290cc3ce"
    
    static let params: [String : Any] = ["ts" : KeyParameter.ts,
                                   "apikey": KeyParameter.apikey,
                                   "hash": KeyParameter.hash]
}
