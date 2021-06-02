//
//  Result.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation 
import Gloss

//MARK: - Result
final class Result: Glossy {
    public var comics : Comic!
    public var descriptionField : String!
    public var events : Event!
    public var id : Int!
    public var modified : String!
    public var name : String!
    public var resourceURI : String!
    public var series : Series!
    public var stories : Story!
//    public var thumbnail : Thumbnail!
//    public var urls : [Url]!

	//MARK: Default Initializer 
	init()
	{
        comics = Comic()
        descriptionField = ""
        events = Event()
        id = 0
        modified = ""
        name = ""
        resourceURI = ""
        series = Series()
        stories = Story()
//        thumbnail = Thumbnail()
//        urls = []
    }


	//MARK: Decodable
	public required init?(json: JSON){
        if let comics : Comic = "comics" <~~ json {
            self.comics = comics
        }else{
            self.comics = Comic()
        }
        if let descriptionField : String = "description" <~~ json {
            self.descriptionField = descriptionField
        }else{
            self.descriptionField = ""
        }
        if let events : Event = "events" <~~ json {
            self.events = events
        }else{
            self.events = Event()
        }
        if let id : Int = "id" <~~ json {
            self.id = id
        }else{
            self.id = 0
        }
        if let modified : String = "modified" <~~ json {
            self.modified = modified
        }else{
            self.modified = ""
        }
        if let name : String = "name" <~~ json {
            self.name = name
        }else{
            self.name = ""
        }
        if let resourceURI : String = "resourceURI" <~~ json {
            self.resourceURI = resourceURI
        }else{
            self.resourceURI = ""
        }
        if let series : Series = "series" <~~ json {
            self.series = series
        }else{
            self.series = Series()
        }
        if let stories : Story = "stories" <~~ json {
            self.stories = stories
        }else{
            self.stories = Story()
        }
//        if let thumbnail : Thumbnail = "thumbnail" <~~ json {
//            self.thumbnail = thumbnail
//        }else{
//            self.thumbnail = Thumbnail()
//        }
//        if let urls : [Url] = "urls" <~~ json {
//            self.urls = urls
//        }else{
//            self.urls = []
//        }
        
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
        "comics" ~~> comics,
        "description" ~~> descriptionField,
        "events" ~~> events,
        "id" ~~> id,
        "modified" ~~> modified,
        "name" ~~> name,
        "resourceURI" ~~> resourceURI,
        "series" ~~> series,
        "stories" ~~> stories,
//        "thumbnail" ~~> thumbnail,
//        "urls" ~~> urls,
		])
	}

}
