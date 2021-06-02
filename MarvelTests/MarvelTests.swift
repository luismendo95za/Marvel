//
//  MarvelTests.swift
//  MarvelTests
//
//  Created by Luis Alberto Mendoza Reyna on 29/5/21.
//

import XCTest
@testable import Marvel

class MarvelTests: XCTestCase {

    var dashboardVc: DashboardViewController?

    override func setUp() {
        dashboardVc = DashboardViewController()
        dashboardVc?.presenter.setView(view: dashboardVc)
        dashboardVc?.presenter.service = DashboardService()
    }

    func testDashboardService() {
        dashboardVc?.presenter.service?.getCharactersList(completion: { (response) in
            XCTAssertNotNil(response)
            XCTAssertTrue(response.count == 20)
        }, failure: { (error) in })
    }

    override func tearDown() {
        dashboardVc = nil
    }
}

