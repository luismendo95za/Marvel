//
//  Result.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation

public struct CharacterModel : Codable {
    
    public let comics : ComicModel?
    public let descriptionField : String?
    public let events : EventModel?
    public let id : Int?
    public let modified : String?
    public let name : String?
    public let resourceURI : String?
    public let series : SeriesModel?
    public let stories : StoryModel?
    public let image : ImageModel?
    
    
    public enum CodingKeys: String, CodingKey {
        case comics
        case descriptionField = "description"
        case events
        case id
        case modified
        case name
        case resourceURI
        case series
        case stories
        case image = "thumbnail"
    }
}
