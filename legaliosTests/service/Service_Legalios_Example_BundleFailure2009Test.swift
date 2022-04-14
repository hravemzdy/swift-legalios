//
// Created by Ladislav Lisy on 30.06.2021.
//

import Foundation
import Quick
import Nimble

@testable import legalios

class ServiceBundleFailure2010Test: QuickSpec {
    override func spec() {
        describe("TestBundleFailure_ForYear2009") {
            let test_examples: [(title: String, tests: [(title: String, year: Int16, month: Int16)])] = [
                ("2009", [
                    ( "2009-1", 2009, 1 ),
                    ( "2009-2", 2009, 2 ),
                    ( "2009-3", 2009, 3 ),
                    ( "2009-4", 2009, 4 ),
                    ( "2009-5", 2009, 5 ),
                    ( "2009-6", 2009, 6 ),
                    ( "2009-7", 2009, 7 ),
                    ( "2009-8", 2009, 8 ),
                    ( "2009-9", 2009, 9 ),
                    ( "2009-10", 2009, 10 ),
                    ( "2009-11", 2009, 11 ),
                    ( "2009-12", 2009, 12 ),
                ]),
            ]
            test_examples.forEach { (title: String, tests: [(title: String, year: Int16, month: Int16)]) in
                describe("tests for year \(title)") {
                    tests.forEach { (title: String, year: Int16, month: Int16) in
                        context("period \(title)") {
                            var bundle: IBundleProps?
                            var error: HistoryResultError?

                            beforeEach {
                                let period = Period(year: year, month: month)
                                let service = ServiceLegalios()
                                let result: Result<IBundleProps, HistoryResultError> = service.getBundle(period)
                                bundle = nil
                                error = nil
                                switch (result) {
                                case .success(let b): bundle = b
                                case .failure(let e): error = e
                                }
                            }

                            it("GetProps should return error") {
                                expect(error).toNot(beNil())
                            }
                            it("GetProps should return props be nil") {
                                expect(bundle).to(beNil())
                            }
                        }
                    }
                }
            }
        }
    }
}
