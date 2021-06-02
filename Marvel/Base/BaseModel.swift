//
//  VFBaseModel.swift
//  MyVodafone
//
//  Created by Luis Alberto Mendoza Reyna on 29/05/21.
//  Copyright © 2017 TSSE. All rights reserved.
//

import Foundation

class BaseModel: NSObject, ApiBaseModelProtocol {
    
    //MARK: Initalization
    override init() {
    }
    
    //MARK: Glossy parsing methods
    required init?(json: JSON) {
    }
    
    func toJSON() -> JSON? {
        return nil
    }
}
