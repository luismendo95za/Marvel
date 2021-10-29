//
//  DataResponse.swift
//  Marvel
//
//  Created by luis a mendoza reyna on 29/10/21.
//

import Foundation

public struct RootModel : Codable {
    
    public let attributionHTML : String?
    public let attributionText : String?
    public let code : Int?
    public let copyright : String?
    public let data : DataModel?
    public let etag : String?
    public let status : String?
    
    public enum CodingKeys: String, CodingKey {
        case attributionHTML
        case attributionText
        case code
        case copyright
        case data
        case etag
        case status 
    }
}
