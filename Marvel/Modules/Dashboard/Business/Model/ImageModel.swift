//
//  Thumbnail.swift
//  Marvel
//
//  Created by luis a mendoza reyna on 27/10/21.
//

import Foundation

//MARK: - Thumbnail
public class ImageModel: Codable {
    public let extensionImage : String?
    public let path: String?

    public enum CodingKeys: String, CodingKey {
        case extensionImage = "extension"
        case path 
    }
    
    func getPathImage() -> String {
        return ((path ?? "") + "." + (extensionImage ?? ""))
    }
}
