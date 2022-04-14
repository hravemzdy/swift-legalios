//
// Created by Ladislav Lisy on 16.07.2021.
//

import Foundation
import Quick
import Nimble

@testable import legalios

#if __PROTOKOL_TEST_FILE__
class ProtokolSocialTest: QuickSpec {
    override func spec() {
        describe("GetProps_ShouldExport_MaxAnnualsBasis") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "03_Social_01_MaxAnnualsBasis.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.maxAnnualsBasis })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_FactorEmployer") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsDecFile(fileName: "03_Social_02_FactorEmployer.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.factorEmployer })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_FactorEmployerHigher") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsDecFile(fileName: "03_Social_03_FactorEmployerHigher.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.factorEmployerHigher })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_FactorEmployee") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsDecFile(fileName: "03_Social_04_FactorEmployee.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.factorEmployee })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_FactorEmployeeGarant") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsDecFile(fileName: "03_Social_05_FactorEmployeeGarant.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.factorEmployeeGarant })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_FactorEmployeeReduce") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsDecFile(fileName: "03_Social_06_FactorEmployeeReduce.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.factorEmployeeReduce })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_MarginIncomeEmp") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "03_Social_07_MarginIncomeEmp.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.marginIncomeEmp })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_MarginIncomeAgr") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySocial?

                    beforeEach {
                        factory = FactorySocial()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "03_Social_08_MarginIncomeAgr.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.marginIncomeAgr })
                    }
                }
            }
        }
    }
}
#endif