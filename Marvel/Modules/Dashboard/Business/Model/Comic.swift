//
//  Comic.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation 
import Gloss

//MARK: - Comic
final class Comic: Glossy {
    public var available : Int!
    public var collectionURI : String!
    public var items : [AnyObject]!
    public var returned : Int!

	//MARK: Default Initializer 
	init()
	{
        available = 0
        collectionURI = ""
        items = []
        returned = 0
    }


	//MARK: Decodable
	public required init?(json: JSON){
        if let available : Int = "available" <~~ json {
            self.available = available
        }else{
            self.available = 0
        }
        if let collectionURI : String = "collectionURI" <~~ json {
            self.collectionURI = collectionURI
        }else{
            self.collectionURI = ""
        }
        if let items : [AnyObject] = "items" <~~ json {
            self.items = items
        }else{
            self.items = []
        }
        if let returned : Int = "returned" <~~ json {
            self.returned = returned
        }else{
            self.returned = 0
        }
        
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
        "available" ~~> available,
        "collectionURI" ~~> collectionURI,
        "items" ~~> items,
        "returned" ~~> returned,
		])
	}

}
