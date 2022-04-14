//
// Created by Ladislav Lisy on 16.07.2021.
//

import Foundation
import Quick
import Nimble

@testable import legalios

#if __PROTOKOL_TEST_FILE__
class ProtokolSalaryTest: QuickSpec {
    override func spec() {
        describe("GetProps_ShouldExport_WorkingShiftWeek") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySalary?

                    beforeEach {
                        factory = FactorySalary()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "02_Salary_01_WorkingShiftWeek.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.workingShiftWeek })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_WorkingShiftTime") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySalary?

                    beforeEach {
                        factory = FactorySalary()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "02_Salary_02_WorkingShiftTime.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.workingShiftTime })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_MinMonthlyWage") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySalary?

                    beforeEach {
                        factory = FactorySalary()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "02_Salary_03_MinMonthlyWage.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.minMonthlyWage })
                    }
                }
            }
        }
        describe("GetProps_ShouldExport_MinHourlyWage") {
            let test_examples: [(title: String, minYear: Int16, maxYear: Int16)] = [
                ("2010-2022", 2010, 2022),
            ]
            test_examples.forEach { (title: String, minYear: Int16, maxYear: Int16) in
                context("tests for years \(title)") {
                    var factory: FactorySalary?

                    beforeEach {
                        factory = FactorySalary()
                    }

                    it("GetProps should export values") {
                        exportPropsIntFile(fileName: "02_Salary_04_MinHourlyWage.txt",
                                minYear: minYear, maxYear: maxYear, sut: factory!,
                                function: { prop in prop.minHourlyWage })
                    }
                }
            }
        }
    }
}
#endif