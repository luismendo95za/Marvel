//
//  Story.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation

//MARK: - Story
public struct StoryModel: Codable {
    
    public let available : Int?
    public let collectionURI : String?
    public var items : [ItemModel]?
    public let returned : Int?

    public enum CodingKeys: String, CodingKey {
        case available
        case collectionURI
        case returned 
        case items
    }
}
