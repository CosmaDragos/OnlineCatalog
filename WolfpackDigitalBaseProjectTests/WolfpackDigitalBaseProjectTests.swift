//
//  WolfpackDigitalBaseProjectTests.swift
//  WolfpackDigitalBaseProjectTests
//
//  Created by Bianca Felecan on 01/12/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import XCTest
import Bond
import ReactiveKit

@testable import WolfpackDigitalBaseProject

class WolfpackDigitalBaseProjectTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        _ = Keychain.standard.clear()
    }

    func testBindable() {
        class MockViewModel {
            let observable = Observable<String>("")
        }
        
        class MockBindable: Bindable {
            
            typealias ViewModel = MockViewModel

            var viewModel: MockViewModel? = MockViewModel() {
                didSet {
                    self.clearBindings()
                    self.setupBindings()
                }
            }
            
            let disposeBag = DisposeBag()
            
            func setupBindings() {
                XCTAssert(self.disposeBag.isDisposed)
                
                self.observe(viewModel!.observable) { (value) in
                    XCTAssert(value == "")
                }
                
                XCTAssert(!self.disposeBag.isDisposed)
            }
        }
        
        var bindable: MockBindable? = MockBindable()
        let disposeBag = bindable?.disposeBag
        bindable = nil
        XCTAssert(disposeBag?.isDisposed == true)
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

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
