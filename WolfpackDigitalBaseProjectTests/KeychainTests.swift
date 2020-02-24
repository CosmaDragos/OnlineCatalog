//
//  KeychainTests.swift
//  WolfpackDigitalBaseProjectTests
//
//  Created by Dan Ilies on 06/02/2020.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import XCTest

@testable import WolfpackDigitalBaseProject

class KeychainTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testKeychain() {
        let string1 = "string1"
        let key1 = "key1"
        guard let data1 = string1.data(using: .utf8) else {
            XCTAssert(false)
            return
        }
        var didSet = Keychain.standard.set(data1, forKey: key1)
        XCTAssert(didSet, "Could not set data for key key1")
        
        guard let storedObject = Keychain.standard.object(forKey: key1) else {
            XCTAssert(false, "Could not find object stored with key key1")
            return
        }
        
        guard let decodedString = String(bytes: storedObject, encoding: .utf8) else {
            XCTAssert(false, "Could not decode string from retreived data")
            return
        }
        
        XCTAssert(decodedString == string1)
        
        let didRemove = Keychain.standard.delete(key: key1)
        XCTAssert(didRemove, "Could not remove")
        
        let string2 = "string2"
        let key2 = "key2"
        let string3 = "string3"
        let key3 = "key3"
        
        guard let data2 = string2.data(using: .utf8),
            let data3 = string3.data(using: .utf8) else {
            XCTAssert(false)
            return
        }
        didSet = Keychain.standard.set(data2, forKey: key2)
        XCTAssert(didSet, "Could not set data for key key2")
        
        didSet = Keychain.standard.set(data3, forKey: key3)
        XCTAssert(didSet, "Could not set data for key key3")
        
        let didClear = Keychain.standard.clear()
        XCTAssert(didClear == true, "Keychain failed to clear")
        
        let storedObject2 = Keychain.standard.object(forKey: key2)
        XCTAssert(storedObject2 == nil, "Keychain did not clear")
        
        let storedObject3 = Keychain.standard.object(forKey: key3)
        XCTAssert(storedObject3 == nil, "Keychain did not clear")
    }

}
