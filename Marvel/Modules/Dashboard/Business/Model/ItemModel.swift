//
//  Item.swift
//  Marvel
//
//  Created by luis a mendoza reyna on 29/10/21.
//

import Foundation

public struct ItemModel : Codable {
    
    public let name : String?
    public let resourceURI : String?
    
    public enum CodingKeys: String, CodingKey {
        case name
        case resourceURI
    }
}
