//
//  BaseProjectTests.swift
//  WolfpackDigitalBaseProjectTests
//
//  Created by Bianca Felecan on 01/12/2019.
//  Copyright © 2020 Wolfpack Digital. All rights reserved.
//

import XCTest
import Bond
import ReactiveKit

@testable import WolfpackDigitalBaseProject

class BaseProjectTests: XCTestCase {

    override func setUp() {

    }

    override func tearDown() {
        Keychain.standard.clear()
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

    func testArraySubscript() {
        let array = [1, 2, 3, 4, 5]
        XCTAssertEqual(array[safe: 2], 3)
    }

    func testStringIsEmail() {
        let email = "bianca@wolfpack-digital.com"
        XCTAssertEqual(email.isEmail, true)

        let notAnEmail1 = "bianca.wolfpack"
        XCTAssertEqual(notAnEmail1.isEmail, false)

        let notAnEmail2 = "bianca.wolfpack@"
        XCTAssertEqual(notAnEmail2.isEmail, false)

        let notAnEmail3 = "bianca.wolfpack@.a"
        XCTAssertEqual(notAnEmail3.isEmail, false)
    }

}
