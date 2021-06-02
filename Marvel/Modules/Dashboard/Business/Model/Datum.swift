//
//  Datum.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on May 30, 2021

import Foundation 
import Gloss

//MARK: - Datum
final class Datum: Glossy {
    public var count : Int!
    public var limit : Int!
    public var offset : Int!
    public var results : [Result]!
    public var total : Int!

	//MARK: Default Initializer 
	init()
	{
        count = 0
        limit = 0
        offset = 0
        results = []
        total = 0
    }


	//MARK: Decodable
	public required init?(json: JSON){
        if let count : Int = "count" <~~ json {
            self.count = count
        }else{
            self.count = 0
        }
        if let limit : Int = "limit" <~~ json {
            self.limit = limit
        }else{
            self.limit = 0
        }
        if let offset : Int = "offset" <~~ json {
            self.offset = offset
        }else{
            self.offset = 0
        }
        if let results : [Result] = "results" <~~ json {
            self.results = results
        }else{
            self.results = []
        }
        if let total : Int = "total" <~~ json {
            self.total = total
        }else{
            self.total = 0
        }
        
	}


	//MARK: Encodable
	public func toJSON() -> JSON? {
		return jsonify([
        "count" ~~> count,
        "limit" ~~> limit,
        "offset" ~~> offset,
        "results" ~~> results,
        "total" ~~> total,
		])
	}

}
