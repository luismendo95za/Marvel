//
//  Thumbnail.swift
//  Marvel
//
//  Created by luis a mendoza reyna on 27/10/21.
//

import Foundation
import Gloss

//MARK: - Tthumbnail
final class Thumbnail: Glossy {
    public var extensionImage : String!
    public var path : String!
    var absolutePath: String?

    //MARK: Default Initializer
    init()
    {
        extensionImage = ""
        path = ""
    }


    //MARK: Decodable
    public required init? (json: JSON){
        if let extensionImage : String = "extension" <~~ json {
            self.extensionImage = extensionImage
        } else {
            self.extensionImage = ""
        }
        if let path : String = "path" <~~ json {
            self.path = path
        } else {
            self.path = ""
        }
        self.absolutePath = path + "." + extensionImage
    }


    //MARK: Encodable
    public func toJSON() -> JSON? {
        return jsonify([
        "extension" ~~> extensionImage,
        "path" ~~> path,
        ])
    }
}
