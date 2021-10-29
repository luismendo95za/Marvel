//
//  Event.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation 

//MARK: - Event
public struct EventModel: Codable {
    public let available : Int?
    public let collectionURI : String?
    public let items : [ItemModel]?
    public let returned : Int?
    
    public enum CodingKeys: String, CodingKey {
        case available
        case collectionURI
        case returned 
        case items
    }
}
