//
// Created by Ladislav Lisy on 16.07.2021.
//

import Foundation
import Quick
import Nimble

@testable import legalios

#if __PROTOKOL_TEST_FILE__
class ProtokolHealthTest: QuickSpec {
    override func spec() {
        describe("GetProps_ShouldExport_MinMonthlyBasis") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "01_Health_01_MinMonthlyBasis.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.minMonthlyBasis })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_MaxAnnualsBasis") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "01_Health_02_MaxAnnualsBasis.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.maxAnnualsBasis })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_LimMonthlyState") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "01_Health_03_LimMonthlyState.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.limMonthlyState })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_LimMonthlyDis50") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "01_Health_04_LimMonthlyDis50.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.limMonthlyDis50 })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_FactorCompound") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsDecFile(fileName: "01_Health_05_FactorCompound.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.factorCompound })
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
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsDecFile(fileName: "01_Health_06_FactorEmployee.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.factorEmployee })
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
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "01_Health_07_MarginIncomeEmp.txt",
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
                    var factory: FactoryHealth?

                    beforeEach {
                        factory = FactoryHealth()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "01_Health_08_MarginIncomeAgr.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.marginIncomeAgr })
                    }
                }
            }
        }
    }
}
#endif