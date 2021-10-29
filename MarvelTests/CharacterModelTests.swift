//
//  CharacterModelTests.swift
//  MarvelTests
//
//  Created by Luis Alberto Mendoza Reyna on 1/6/21.
//

import XCTest

@testable import Marvel

class CharacterModelTests: BaseTest {
    
    func testsTopUpRecordParser() throws {
        let model: Datum? = try getJSONObject(bundle: bundle, for: "result")
        
        XCTAssertNotNil(model)
        XCTAssertNotNil(model?.count)
        XCTAssertNotNil(model?.offset)
    }
    
    
    func getJSONObject<T:Glossy>(bundle: Bundle, for jsonName: String) throws -> T? {
        guard let json = try getJSON(bundle: bundle, for: jsonName) else { return nil }
        return T.init(json: json)
    }
    
    func getJSON(bundle: Bundle, for jsonName: String) throws -> JSON? {
        guard let path = bundle.path(forResource: jsonName, ofType: "json") else {
            fatalError("Could not retrieve file \(jsonName).json")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON
    }
}
