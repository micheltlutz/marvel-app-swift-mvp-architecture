//
//  ItemsTests.swift
//  MarvelTests
//
//  Created by Juliano Terres on 30/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import XCTest
@testable import Marvel

class ItemsTests: XCTestCaseBase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCharacterWithoutData() {
        let items = Items()
        XCTAssertNotNil(items)
    }
    
}
