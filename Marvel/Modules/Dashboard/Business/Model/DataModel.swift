//
//  Datum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation

//MARK: - Datum
public struct DataModel: Codable {
    public let count : Int?
    public let limit : Int?
    public let offset : Int?
    public let results : [CharacterModel]?
    public let total : Int?
    
    public enum CodingKeys: String, CodingKey {
        case count
        case limit
        case offset
        case results
        case total
    }
}
