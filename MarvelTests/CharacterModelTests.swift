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
        let decoder = JSONDecoder()
        let json: Data = try getJSONObject(bundle: bundle, for: "result")
        let rootModel = try? decoder.decode(RootModel.self, from: json)
        XCTAssertNotNil(rootModel)
        XCTAssertNotNil(rootModel?.data?.count)
        XCTAssertNotNil(rootModel?.data?.offset)
    }
    
    func getJSONObject(bundle: Bundle, for jsonName: String) throws -> Data {
        guard let path = bundle.path(forResource: jsonName, ofType: "json") else {
            fatalError("Could not retrieve file \(jsonName).json")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }
}
