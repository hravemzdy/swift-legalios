import Foundation
import Quick
import Nimble

@testable import legalios

#if __PROTOKOL_TEST_FILE__
class FactoriesHistoryTest: QuickSpec {
    override func spec() {
        let _sutSalary = FactorySalary()
        let _sutHealth = FactoryHealth()
        let _sutSocial = FactorySocial()
        let _sutTaxing = FactoryTaxing()

        describe("GetProps_ShouldExport_History") {
            let test_examples: [(minYear: Int16, maxYear: Int16)] = [
                (2010, 2022),
            ]
            test_examples.forEach { (minYear: Int16, maxYear: Int16) in
                it("GetProps should export values") {
                    #if __PROTOKOL_TEST_FILE__
                    do {
                        let testProtokol = try createHistoryFile(fileName: "history_\(minYear)_\(maxYear).xls")

                        var headerData: Array<(Int16, Bool)> = []
                        for testYear: Int16 in minYear...maxYear {
                            var yearWithChanges = false

                            let testPeriod = Period.getWithYearMonth(year: testYear, month: 1)

                            var testSalaryProp: IPropsSalary = _sutSalary.getProps(testPeriod)
                            var testHealthProp: IPropsHealth = _sutHealth.getProps(testPeriod)
                            var testSocialProp: IPropsSocial = _sutSocial.getProps(testPeriod)
                            var testTaxingProp: IPropsTaxing = _sutTaxing.getProps(testPeriod)

                            for testMonth: Int16 in 2...12 {
                                let nextPeriod = Period.getWithYearMonth(year: testYear, month: testMonth)

                                let testSalaryNext: IPropsSalary = _sutSalary.getProps(nextPeriod)
                                let testHealthNext: IPropsHealth = _sutHealth.getProps(nextPeriod)
                                let testSocialNext: IPropsSocial = _sutSocial.getProps(nextPeriod)
                                let testTaxingNext: IPropsTaxing = _sutTaxing.getProps(nextPeriod)

                                if (testSalaryNext.valueEquals(other: testSalaryProp) == false)
                                {
                                    yearWithChanges = true
                                }
                                if (testHealthNext.valueEquals(other: testHealthProp) == false)
                                {
                                    yearWithChanges = true
                                }
                                if (testSocialNext.valueEquals(other: testSocialProp) == false)
                                {
                                    yearWithChanges = true
                                }
                                if (testTaxingNext.valueEquals(other: testTaxingProp) == false)
                                {
                                    yearWithChanges = true
                                }
                                testSalaryProp = testSalaryNext
                                testHealthProp = testHealthNext
                                testSocialProp = testSocialNext
                                testTaxingProp = testTaxingNext
                            }
                            headerData.append((testYear, yearWithChanges))
                        }
                        exportHistoryStart(protokol: testProtokol, data: headerData)

                        var VECT_HEALTH_MIN_MONTHLY_BASIS: Array<(Int16, Int16, String, String)> = []
                        var VECT_HEALTH_MAX_ANNUALS_BASIS: Array<(Int16, Int16, String, String)> = []
                        var VECT_HEALTH_LIM_MONTHLY_STATE: Array<(Int16, Int16, String, String)> = []
                        var VECT_HEALTH_LIM_MONTHLY_DIS50: Array<(Int16, Int16, String, String)> = []
                        var VECT_HEALTH_FACTOR_COMPOUND: Array<(Int16, Int16, String, String)> = []
                        var VECT_HEALTH_FACTOR_EMPLOYEE: Array<(Int16, Int16, String, String)> = []
                        var VECT_HEALTH_MARGIN_INCOME_EMP: Array<(Int16, Int16, String, String)> = []
                        var VECT_HEALTH_MARGIN_INCOME_AGR: Array<(Int16, Int16, String, String)> = []
                        var VECT_SALARY_WORKING_SHIFT_WEEK: Array<(Int16, Int16, String, String)> = []
                        var VECT_SALARY_WORKING_SHIFT_TIME: Array<(Int16, Int16, String, String)> = []
                        var VECT_SALARY_MIN_MONTHLY_WAGE: Array<(Int16, Int16, String, String)> = []
                        var VECT_SALARY_MIN_HOURLY_WAGE: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_MAX_ANNUALS_BASIS: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_FACTOR_EMPLOYER: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_FACTOR_EMPLOYER_HIGHER: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_FACTOR_EMPLOYEE: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_FACTOR_EMPLOYEE_GARANT: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_FACTOR_EMPLOYEE_REDUCE: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_MARGIN_INCOME_EMP: Array<(Int16, Int16, String, String)> = []
                        var VECT_SOCIAL_MARGIN_INCOME_AGR: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_PAYER: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_DISAB_1ST: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_DISAB_2ND: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_DISAB_3RD: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_STUDY: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_CHILD_1ST: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_CHILD_2ND: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_ALLOWANCE_CHILD_3RD: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_FACTOR_ADVANCES: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_FACTOR_WITHHOLD: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_FACTOR_SOLIDARY: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_FACTOR_TAXRATE2: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MIN_AMOUNT_OF_TAXBONUS: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MAX_AMOUNT_OF_TAXBONUS: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MARGIN_INCOME_OF_TAXBONUS: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MARGIN_INCOME_OF_ROUNDING: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MARGIN_INCOME_OF_WITHHOLD: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MARGIN_INCOME_OF_SOLIDARY: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MARGIN_INCOME_OF_TAXRATE2: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MARGIN_INCOME_OF_WHT_EMP: Array<(Int16, Int16, String, String)> = []
                        var VECT_TAXING_MARGIN_INCOME_OF_WHT_AGR: Array<(Int16, Int16, String, String)> = []

                        for testYear: Int16 in minYear...maxYear {
                            var MES_HEALTH_MIN_MONTHLY_BASIS: Int16 = 0
                            var MES_HEALTH_MAX_ANNUALS_BASIS: Int16 = 0
                            var MES_HEALTH_LIM_MONTHLY_STATE: Int16 = 0
                            var MES_HEALTH_LIM_MONTHLY_DIS50: Int16 = 0
                            var MES_HEALTH_FACTOR_COMPOUND: Int16 = 0
                            var MES_HEALTH_FACTOR_EMPLOYEE: Int16 = 0
                            var MES_HEALTH_MARGIN_INCOME_EMP: Int16 = 0
                            var MES_HEALTH_MARGIN_INCOME_AGR: Int16 = 0
                            var MES_SALARY_WORKING_SHIFT_WEEK: Int16 = 0
                            var MES_SALARY_WORKING_SHIFT_TIME: Int16 = 0
                            var MES_SALARY_MIN_MONTHLY_WAGE: Int16 = 0
                            var MES_SALARY_MIN_HOURLY_WAGE: Int16 = 0
                            var MES_SOCIAL_MAX_ANNUALS_BASIS: Int16 = 0
                            var MES_SOCIAL_FACTOR_EMPLOYER: Int16 = 0
                            var MES_SOCIAL_FACTOR_EMPLOYER_HIGHER: Int16 = 0
                            var MES_SOCIAL_FACTOR_EMPLOYEE: Int16 = 0
                            var MES_SOCIAL_FACTOR_EMPLOYEE_GARANT: Int16 = 0
                            var MES_SOCIAL_FACTOR_EMPLOYEE_REDUCE: Int16 = 0
                            var MES_SOCIAL_MARGIN_INCOME_EMP: Int16 = 0
                            var MES_SOCIAL_MARGIN_INCOME_AGR: Int16 = 0
                            var MES_TAXING_ALLOWANCE_PAYER: Int16 = 0
                            var MES_TAXING_ALLOWANCE_DISAB_1ST: Int16 = 0
                            var MES_TAXING_ALLOWANCE_DISAB_2ND: Int16 = 0
                            var MES_TAXING_ALLOWANCE_DISAB_3RD: Int16 = 0
                            var MES_TAXING_ALLOWANCE_STUDY: Int16 = 0
                            var MES_TAXING_ALLOWANCE_CHILD_1ST: Int16 = 0
                            var MES_TAXING_ALLOWANCE_CHILD_2ND: Int16 = 0
                            var MES_TAXING_ALLOWANCE_CHILD_3RD: Int16 = 0
                            var MES_TAXING_FACTOR_ADVANCES: Int16 = 0
                            var MES_TAXING_FACTOR_WITHHOLD: Int16 = 0
                            var MES_TAXING_FACTOR_SOLIDARY: Int16 = 0
                            var MES_TAXING_FACTOR_TAXRATE2: Int16 = 0
                            var MES_TAXING_MIN_AMOUNT_OF_TAXBONUS: Int16 = 0
                            var MES_TAXING_MAX_AMOUNT_OF_TAXBONUS: Int16 = 0
                            var MES_TAXING_MARGIN_INCOME_OF_TAXBONUS: Int16 = 0
                            var MES_TAXING_MARGIN_INCOME_OF_ROUNDING: Int16 = 0
                            var MES_TAXING_MARGIN_INCOME_OF_WITHHOLD: Int16 = 0
                            var MES_TAXING_MARGIN_INCOME_OF_SOLIDARY: Int16 = 0
                            var MES_TAXING_MARGIN_INCOME_OF_TAXRATE2: Int16 = 0
                            var MES_TAXING_MARGIN_INCOME_OF_WHT_EMP: Int16 = 0
                            var MES_TAXING_MARGIN_INCOME_OF_WHT_AGR: Int16 = 0

                            let testPeriod = Period.getWithYearMonth(year: testYear, month: 1)

                            var testSalaryProp: IPropsSalary = _sutSalary.getProps(testPeriod)
                            var testHealthProp: IPropsHealth = _sutHealth.getProps(testPeriod)
                            var testSocialProp: IPropsSocial = _sutSocial.getProps(testPeriod)
                            var testTaxingProp: IPropsTaxing = _sutTaxing.getProps(testPeriod)

                            let JAN_HEALTH_MIN_MONTHLY_BASIS = propsValueToString(value: testHealthProp.minMonthlyBasis)
                            let JAN_HEALTH_MAX_ANNUALS_BASIS = propsValueToString(value: testHealthProp.maxAnnualsBasis)
                            let JAN_HEALTH_LIM_MONTHLY_STATE = propsValueToString(value: testHealthProp.limMonthlyState)
                            let JAN_HEALTH_LIM_MONTHLY_DIS50 = propsValueToString(value: testHealthProp.limMonthlyDis50)
                            let JAN_HEALTH_FACTOR_COMPOUND = propsValueToString(value: testHealthProp.factorCompound)
                            let JAN_HEALTH_FACTOR_EMPLOYEE = propsValueToString(value: testHealthProp.factorEmployee)
                            let JAN_HEALTH_MARGIN_INCOME_EMP = propsValueToString(value: testHealthProp.marginIncomeEmp)
                            let JAN_HEALTH_MARGIN_INCOME_AGR = propsValueToString(value: testHealthProp.marginIncomeAgr)
                            let JAN_SALARY_WORKING_SHIFT_WEEK = propsValueToString(value: testSalaryProp.workingShiftWeek)
                            let JAN_SALARY_WORKING_SHIFT_TIME = propsValueToString(value: testSalaryProp.workingShiftTime)
                            let JAN_SALARY_MIN_MONTHLY_WAGE = propsValueToString(value: testSalaryProp.minMonthlyWage)
                            let JAN_SALARY_MIN_HOURLY_WAGE = propsValueToString(value: testSalaryProp.minHourlyWage)
                            let JAN_SOCIAL_MAX_ANNUALS_BASIS = propsValueToString(value: testSocialProp.maxAnnualsBasis)
                            let JAN_SOCIAL_FACTOR_EMPLOYER = propsValueToString(value: testSocialProp.factorEmployer)
                            let JAN_SOCIAL_FACTOR_EMPLOYER_HIGHER = propsValueToString(value: testSocialProp.factorEmployerHigher)
                            let JAN_SOCIAL_FACTOR_EMPLOYEE = propsValueToString(value: testSocialProp.factorEmployee)
                            let JAN_SOCIAL_FACTOR_EMPLOYEE_GARANT = propsValueToString(value: testSocialProp.factorEmployeeGarant)
                            let JAN_SOCIAL_FACTOR_EMPLOYEE_REDUCE = propsValueToString(value: testSocialProp.factorEmployeeReduce)
                            let JAN_SOCIAL_MARGIN_INCOME_EMP = propsValueToString(value: testSocialProp.marginIncomeEmp)
                            let JAN_SOCIAL_MARGIN_INCOME_AGR = propsValueToString(value: testSocialProp.marginIncomeAgr)
                            let JAN_TAXING_ALLOWANCE_PAYER = propsValueToString(value: testTaxingProp.allowancePayer)
                            let JAN_TAXING_ALLOWANCE_DISAB_1ST = propsValueToString(value: testTaxingProp.allowanceDisab1st)
                            let JAN_TAXING_ALLOWANCE_DISAB_2ND = propsValueToString(value: testTaxingProp.allowanceDisab2nd)
                            let JAN_TAXING_ALLOWANCE_DISAB_3RD = propsValueToString(value: testTaxingProp.allowanceDisab3rd)
                            let JAN_TAXING_ALLOWANCE_STUDY = propsValueToString(value: testTaxingProp.allowanceStudy)
                            let JAN_TAXING_ALLOWANCE_CHILD_1ST = propsValueToString(value: testTaxingProp.allowanceChild1st)
                            let JAN_TAXING_ALLOWANCE_CHILD_2ND = propsValueToString(value: testTaxingProp.allowanceChild2nd)
                            let JAN_TAXING_ALLOWANCE_CHILD_3RD = propsValueToString(value: testTaxingProp.allowanceChild3rd)
                            let JAN_TAXING_FACTOR_ADVANCES = propsValueToString(value: testTaxingProp.factorAdvances)
                            let JAN_TAXING_FACTOR_WITHHOLD = propsValueToString(value: testTaxingProp.factorWithhold)
                            let JAN_TAXING_FACTOR_SOLIDARY = propsValueToString(value: testTaxingProp.factorSolidary)
                            let JAN_TAXING_FACTOR_TAXRATE2 = propsValueToString(value: testTaxingProp.factorTaxRate2)
                            let JAN_TAXING_MIN_AMOUNT_OF_TAXBONUS = propsValueToString(value: testTaxingProp.minAmountOfTaxBonus)
                            let JAN_TAXING_MAX_AMOUNT_OF_TAXBONUS = propsValueToString(value: testTaxingProp.maxAmountOfTaxBonus)
                            let JAN_TAXING_MARGIN_INCOME_OF_TAXBONUS = propsValueToString(value: testTaxingProp.marginIncomeOfTaxBonus)
                            let JAN_TAXING_MARGIN_INCOME_OF_ROUNDING = propsValueToString(value: testTaxingProp.marginIncomeOfRounding)
                            let JAN_TAXING_MARGIN_INCOME_OF_WITHHOLD = propsValueToString(value: testTaxingProp.marginIncomeOfWithhold)
                            let JAN_TAXING_MARGIN_INCOME_OF_SOLIDARY = propsValueToString(value: testTaxingProp.marginIncomeOfSolidary)
                            let JAN_TAXING_MARGIN_INCOME_OF_TAXRATE2 = propsValueToString(value: testTaxingProp.marginIncomeOfTaxRate2)
                            let JAN_TAXING_MARGIN_INCOME_OF_WHT_EMP = propsValueToString(value: testTaxingProp.marginIncomeOfWthEmp)
                            let JAN_TAXING_MARGIN_INCOME_OF_WHT_AGR = propsValueToString(value: testTaxingProp.marginIncomeOfWthAgr)

                            for testMonth: Int16 in 2...12 {
                                let nextPeriod = Period.getWithYearMonth(year: testYear, month: testMonth)

                                let testSalaryNext: IPropsSalary = _sutSalary.getProps(nextPeriod)
                                let testHealthNext: IPropsHealth = _sutHealth.getProps(nextPeriod)
                                let testSocialNext: IPropsSocial = _sutSocial.getProps(nextPeriod)
                                let testTaxingNext: IPropsTaxing = _sutTaxing.getProps(nextPeriod)

                                if (testHealthNext.minMonthlyBasis != testHealthProp.minMonthlyBasis) {
                                    MES_HEALTH_MIN_MONTHLY_BASIS = testMonth
                                }
                                if (testHealthNext.maxAnnualsBasis != testHealthProp.maxAnnualsBasis) {
                                    MES_HEALTH_MAX_ANNUALS_BASIS = testMonth
                                }
                                if (testHealthNext.limMonthlyState != testHealthProp.limMonthlyState) {
                                    MES_HEALTH_LIM_MONTHLY_STATE = testMonth
                                }
                                if (testHealthNext.limMonthlyDis50 != testHealthProp.limMonthlyDis50) {
                                    MES_HEALTH_LIM_MONTHLY_DIS50 = testMonth
                                }
                                if (testHealthNext.factorCompound != testHealthProp.factorCompound) {
                                    MES_HEALTH_FACTOR_COMPOUND = testMonth
                                }
                                if (testHealthNext.factorEmployee != testHealthProp.factorEmployee) {
                                    MES_HEALTH_FACTOR_EMPLOYEE = testMonth
                                }
                                if (testHealthNext.marginIncomeEmp != testHealthProp.marginIncomeEmp) {
                                    MES_HEALTH_MARGIN_INCOME_EMP = testMonth
                                }
                                if (testHealthNext.marginIncomeAgr != testHealthProp.marginIncomeAgr) {
                                    MES_HEALTH_MARGIN_INCOME_AGR = testMonth
                                }
                                if (testSalaryNext.workingShiftWeek != testSalaryProp.workingShiftWeek) {
                                    MES_SALARY_WORKING_SHIFT_WEEK = testMonth
                                }
                                if (testSalaryNext.workingShiftTime != testSalaryProp.workingShiftTime) {
                                    MES_SALARY_WORKING_SHIFT_TIME = testMonth
                                }
                                if (testSalaryNext.minMonthlyWage != testSalaryProp.minMonthlyWage) {
                                    MES_SALARY_MIN_MONTHLY_WAGE = testMonth
                                }
                                if (testSalaryNext.minHourlyWage != testSalaryProp.minHourlyWage) {
                                    MES_SALARY_MIN_HOURLY_WAGE = testMonth
                                }
                                if (testSocialNext.maxAnnualsBasis != testSocialProp.maxAnnualsBasis) {
                                    MES_SOCIAL_MAX_ANNUALS_BASIS = testMonth
                                }
                                if (testSocialNext.factorEmployer != testSocialProp.factorEmployer) {
                                    MES_SOCIAL_FACTOR_EMPLOYER = testMonth
                                }
                                if (testSocialNext.factorEmployerHigher != testSocialProp.factorEmployerHigher) {
                                    MES_SOCIAL_FACTOR_EMPLOYER_HIGHER = testMonth
                                }
                                if (testSocialNext.factorEmployee != testSocialProp.factorEmployee) {
                                    MES_SOCIAL_FACTOR_EMPLOYEE = testMonth
                                }
                                if (testSocialNext.factorEmployeeReduce != testSocialProp.factorEmployeeReduce) {
                                    MES_SOCIAL_FACTOR_EMPLOYEE_REDUCE = testMonth
                                }
                                if (testSocialNext.factorEmployeeGarant != testSocialProp.factorEmployeeGarant) {
                                    MES_SOCIAL_FACTOR_EMPLOYEE_GARANT = testMonth
                                }
                                if (testSocialNext.marginIncomeEmp != testSocialProp.marginIncomeEmp) {
                                    MES_SOCIAL_MARGIN_INCOME_EMP = testMonth
                                }
                                if (testSocialNext.marginIncomeAgr != testSocialProp.marginIncomeAgr) {
                                    MES_SOCIAL_MARGIN_INCOME_AGR = testMonth
                                }
                                if (testTaxingNext.allowancePayer != testTaxingProp.allowancePayer) {
                                    MES_TAXING_ALLOWANCE_PAYER = testMonth
                                }
                                if (testTaxingNext.allowanceDisab1st != testTaxingProp.allowanceDisab1st) {
                                    MES_TAXING_ALLOWANCE_DISAB_1ST = testMonth
                                }
                                if (testTaxingNext.allowanceDisab2nd != testTaxingProp.allowanceDisab2nd) {
                                    MES_TAXING_ALLOWANCE_DISAB_2ND = testMonth
                                }
                                if (testTaxingNext.allowanceDisab3rd != testTaxingProp.allowanceDisab3rd) {
                                    MES_TAXING_ALLOWANCE_DISAB_3RD = testMonth
                                }
                                if (testTaxingNext.allowanceStudy != testTaxingProp.allowanceStudy) {
                                    MES_TAXING_ALLOWANCE_STUDY = testMonth
                                }
                                if (testTaxingNext.allowanceChild1st != testTaxingProp.allowanceChild1st) {
                                    MES_TAXING_ALLOWANCE_CHILD_1ST = testMonth
                                }
                                if (testTaxingNext.allowanceChild2nd != testTaxingProp.allowanceChild2nd) {
                                    MES_TAXING_ALLOWANCE_CHILD_2ND = testMonth
                                }
                                if (testTaxingNext.allowanceChild3rd != testTaxingProp.allowanceChild3rd) {
                                    MES_TAXING_ALLOWANCE_CHILD_3RD = testMonth
                                }
                                if (testTaxingNext.factorAdvances != testTaxingProp.factorAdvances) {
                                    MES_TAXING_FACTOR_ADVANCES = testMonth
                                }
                                if (testTaxingNext.factorWithhold != testTaxingProp.factorWithhold) {
                                    MES_TAXING_FACTOR_WITHHOLD = testMonth
                                }
                                if (testTaxingNext.factorSolidary != testTaxingProp.factorSolidary) {
                                    MES_TAXING_FACTOR_SOLIDARY = testMonth
                                }
                                if (testTaxingNext.factorTaxRate2 != testTaxingProp.factorTaxRate2) {
                                    MES_TAXING_FACTOR_TAXRATE2 = testMonth
                                }
                                if (testTaxingNext.minAmountOfTaxBonus != testTaxingProp.minAmountOfTaxBonus) {
                                    MES_TAXING_MIN_AMOUNT_OF_TAXBONUS = testMonth
                                }
                                if (testTaxingNext.maxAmountOfTaxBonus != testTaxingProp.maxAmountOfTaxBonus) {
                                    MES_TAXING_MAX_AMOUNT_OF_TAXBONUS = testMonth
                                }
                                if (testTaxingNext.marginIncomeOfTaxBonus != testTaxingProp.marginIncomeOfTaxBonus) {
                                    MES_TAXING_MARGIN_INCOME_OF_TAXBONUS = testMonth
                                }
                                if (testTaxingNext.marginIncomeOfRounding != testTaxingProp.marginIncomeOfRounding) {
                                    MES_TAXING_MARGIN_INCOME_OF_ROUNDING = testMonth
                                }
                                if (testTaxingNext.marginIncomeOfWithhold != testTaxingProp.marginIncomeOfWithhold) {
                                    MES_TAXING_MARGIN_INCOME_OF_WITHHOLD = testMonth
                                }
                                if (testTaxingNext.marginIncomeOfSolidary != testTaxingProp.marginIncomeOfSolidary) {
                                    MES_TAXING_MARGIN_INCOME_OF_SOLIDARY = testMonth
                                }
                                if (testTaxingNext.marginIncomeOfTaxRate2 != testTaxingProp.marginIncomeOfTaxRate2) {
                                    MES_TAXING_MARGIN_INCOME_OF_TAXRATE2 = testMonth
                                }
                                if (testTaxingNext.marginIncomeOfWthEmp != testTaxingProp.marginIncomeOfWthEmp) {
                                    MES_TAXING_MARGIN_INCOME_OF_WHT_EMP = testMonth
                                }
                                if (testTaxingNext.marginIncomeOfWthAgr != testTaxingProp.marginIncomeOfWthAgr) {
                                    MES_TAXING_MARGIN_INCOME_OF_WHT_AGR = testMonth
                                }

                                testSalaryProp = testSalaryNext
                                testHealthProp = testHealthNext
                                testSocialProp = testSocialNext
                                testTaxingProp = testTaxingNext
                            }
                            VECT_HEALTH_MIN_MONTHLY_BASIS.append((testYear, MES_HEALTH_MIN_MONTHLY_BASIS, JAN_HEALTH_MIN_MONTHLY_BASIS, propsValueToString(value: testHealthProp.minMonthlyBasis)))
                            VECT_HEALTH_MAX_ANNUALS_BASIS.append((testYear, MES_HEALTH_MAX_ANNUALS_BASIS, JAN_HEALTH_MAX_ANNUALS_BASIS, propsValueToString(value: testHealthProp.maxAnnualsBasis)))
                            VECT_HEALTH_LIM_MONTHLY_STATE.append((testYear, MES_HEALTH_LIM_MONTHLY_STATE, JAN_HEALTH_LIM_MONTHLY_STATE, propsValueToString(value: testHealthProp.limMonthlyState)))
                            VECT_HEALTH_LIM_MONTHLY_DIS50.append((testYear, MES_HEALTH_LIM_MONTHLY_DIS50, JAN_HEALTH_LIM_MONTHLY_DIS50, propsValueToString(value: testHealthProp.limMonthlyDis50)))
                            VECT_HEALTH_FACTOR_COMPOUND.append((testYear, MES_HEALTH_FACTOR_COMPOUND, JAN_HEALTH_FACTOR_COMPOUND, propsValueToString(value: testHealthProp.factorCompound)))
                            VECT_HEALTH_FACTOR_EMPLOYEE.append((testYear, MES_HEALTH_FACTOR_EMPLOYEE, JAN_HEALTH_FACTOR_EMPLOYEE, propsValueToString(value: testHealthProp.factorEmployee)))
                            VECT_HEALTH_MARGIN_INCOME_EMP.append((testYear, MES_HEALTH_MARGIN_INCOME_EMP, JAN_HEALTH_MARGIN_INCOME_EMP, propsValueToString(value: testHealthProp.marginIncomeEmp)))
                            VECT_HEALTH_MARGIN_INCOME_AGR.append((testYear, MES_HEALTH_MARGIN_INCOME_AGR, JAN_HEALTH_MARGIN_INCOME_AGR, propsValueToString(value: testHealthProp.marginIncomeAgr)))
                            VECT_SALARY_WORKING_SHIFT_WEEK.append((testYear, MES_SALARY_WORKING_SHIFT_WEEK, JAN_SALARY_WORKING_SHIFT_WEEK, propsValueToString(value: testSalaryProp.workingShiftWeek)))
                            VECT_SALARY_WORKING_SHIFT_TIME.append((testYear, MES_SALARY_WORKING_SHIFT_TIME, JAN_SALARY_WORKING_SHIFT_TIME, propsValueToString(value: testSalaryProp.workingShiftTime)))
                            VECT_SALARY_MIN_MONTHLY_WAGE.append((testYear, MES_SALARY_MIN_MONTHLY_WAGE, JAN_SALARY_MIN_MONTHLY_WAGE, propsValueToString(value: testSalaryProp.minMonthlyWage)))
                            VECT_SALARY_MIN_HOURLY_WAGE.append((testYear, MES_SALARY_MIN_HOURLY_WAGE, JAN_SALARY_MIN_HOURLY_WAGE, propsValueToString(value: testSalaryProp.minHourlyWage)))
                            VECT_SOCIAL_MAX_ANNUALS_BASIS.append((testYear, MES_SOCIAL_MAX_ANNUALS_BASIS, JAN_SOCIAL_MAX_ANNUALS_BASIS, propsValueToString(value: testSocialProp.maxAnnualsBasis)))
                            VECT_SOCIAL_FACTOR_EMPLOYER.append((testYear, MES_SOCIAL_FACTOR_EMPLOYER, JAN_SOCIAL_FACTOR_EMPLOYER, propsValueToString(value: testSocialProp.factorEmployer)))
                            VECT_SOCIAL_FACTOR_EMPLOYER_HIGHER.append((testYear, MES_SOCIAL_FACTOR_EMPLOYER_HIGHER, JAN_SOCIAL_FACTOR_EMPLOYER_HIGHER, propsValueToString(value: testSocialProp.factorEmployerHigher)))
                            VECT_SOCIAL_FACTOR_EMPLOYEE.append((testYear, MES_SOCIAL_FACTOR_EMPLOYEE, JAN_SOCIAL_FACTOR_EMPLOYEE, propsValueToString(value: testSocialProp.factorEmployee)))
                            VECT_SOCIAL_FACTOR_EMPLOYEE_GARANT.append((testYear, MES_SOCIAL_FACTOR_EMPLOYEE_GARANT, JAN_SOCIAL_FACTOR_EMPLOYEE_GARANT, propsValueToString(value: testSocialProp.factorEmployeeGarant)))
                            VECT_SOCIAL_FACTOR_EMPLOYEE_REDUCE.append((testYear, MES_SOCIAL_FACTOR_EMPLOYEE_REDUCE, JAN_SOCIAL_FACTOR_EMPLOYEE_REDUCE, propsValueToString(value: testSocialProp.factorEmployeeReduce)))
                            VECT_SOCIAL_MARGIN_INCOME_EMP.append((testYear, MES_SOCIAL_MARGIN_INCOME_EMP, JAN_SOCIAL_MARGIN_INCOME_EMP, propsValueToString(value: testSocialProp.marginIncomeEmp)))
                            VECT_SOCIAL_MARGIN_INCOME_AGR.append((testYear, MES_SOCIAL_MARGIN_INCOME_AGR, JAN_SOCIAL_MARGIN_INCOME_AGR, propsValueToString(value: testSocialProp.marginIncomeAgr)))
                            VECT_TAXING_ALLOWANCE_PAYER.append((testYear, MES_TAXING_ALLOWANCE_PAYER, JAN_TAXING_ALLOWANCE_PAYER, propsValueToString(value: testTaxingProp.allowancePayer)))
                            VECT_TAXING_ALLOWANCE_DISAB_1ST.append((testYear, MES_TAXING_ALLOWANCE_DISAB_1ST, JAN_TAXING_ALLOWANCE_DISAB_1ST, propsValueToString(value: testTaxingProp.allowanceDisab1st)))
                            VECT_TAXING_ALLOWANCE_DISAB_2ND.append((testYear, MES_TAXING_ALLOWANCE_DISAB_2ND, JAN_TAXING_ALLOWANCE_DISAB_2ND, propsValueToString(value: testTaxingProp.allowanceDisab2nd)))
                            VECT_TAXING_ALLOWANCE_DISAB_3RD.append((testYear, MES_TAXING_ALLOWANCE_DISAB_3RD, JAN_TAXING_ALLOWANCE_DISAB_3RD, propsValueToString(value: testTaxingProp.allowanceDisab3rd)))
                            VECT_TAXING_ALLOWANCE_STUDY.append((testYear, MES_TAXING_ALLOWANCE_STUDY, JAN_TAXING_ALLOWANCE_STUDY, propsValueToString(value: testTaxingProp.allowanceStudy)))
                            VECT_TAXING_ALLOWANCE_CHILD_1ST.append((testYear, MES_TAXING_ALLOWANCE_CHILD_1ST, JAN_TAXING_ALLOWANCE_CHILD_1ST, propsValueToString(value: testTaxingProp.allowanceChild1st)))
                            VECT_TAXING_ALLOWANCE_CHILD_2ND.append((testYear, MES_TAXING_ALLOWANCE_CHILD_2ND, JAN_TAXING_ALLOWANCE_CHILD_2ND, propsValueToString(value: testTaxingProp.allowanceChild2nd)))
                            VECT_TAXING_ALLOWANCE_CHILD_3RD.append((testYear, MES_TAXING_ALLOWANCE_CHILD_3RD, JAN_TAXING_ALLOWANCE_CHILD_3RD, propsValueToString(value: testTaxingProp.allowanceChild3rd)))
                            VECT_TAXING_FACTOR_ADVANCES.append((testYear, MES_TAXING_FACTOR_ADVANCES, JAN_TAXING_FACTOR_ADVANCES, propsValueToString(value: testTaxingProp.factorAdvances)))
                            VECT_TAXING_FACTOR_WITHHOLD.append((testYear, MES_TAXING_FACTOR_WITHHOLD, JAN_TAXING_FACTOR_WITHHOLD, propsValueToString(value: testTaxingProp.factorWithhold)))
                            VECT_TAXING_FACTOR_SOLIDARY.append((testYear, MES_TAXING_FACTOR_SOLIDARY, JAN_TAXING_FACTOR_SOLIDARY, propsValueToString(value: testTaxingProp.factorSolidary)))
                            VECT_TAXING_FACTOR_TAXRATE2.append((testYear, MES_TAXING_FACTOR_TAXRATE2, JAN_TAXING_FACTOR_TAXRATE2, propsValueToString(value: testTaxingProp.factorTaxRate2)))
                            VECT_TAXING_MIN_AMOUNT_OF_TAXBONUS.append((testYear, MES_TAXING_MIN_AMOUNT_OF_TAXBONUS, JAN_TAXING_MIN_AMOUNT_OF_TAXBONUS, propsValueToString(value: testTaxingProp.minAmountOfTaxBonus)))
                            VECT_TAXING_MAX_AMOUNT_OF_TAXBONUS.append((testYear, MES_TAXING_MAX_AMOUNT_OF_TAXBONUS, JAN_TAXING_MAX_AMOUNT_OF_TAXBONUS, propsValueToString(value: testTaxingProp.maxAmountOfTaxBonus)))
                            VECT_TAXING_MARGIN_INCOME_OF_TAXBONUS.append((testYear, MES_TAXING_MARGIN_INCOME_OF_TAXBONUS, JAN_TAXING_MARGIN_INCOME_OF_TAXBONUS, propsValueToString(value: testTaxingProp.marginIncomeOfTaxBonus)))
                            VECT_TAXING_MARGIN_INCOME_OF_ROUNDING.append((testYear, MES_TAXING_MARGIN_INCOME_OF_ROUNDING, JAN_TAXING_MARGIN_INCOME_OF_ROUNDING, propsValueToString(value: testTaxingProp.marginIncomeOfRounding)))
                            VECT_TAXING_MARGIN_INCOME_OF_WITHHOLD.append((testYear, MES_TAXING_MARGIN_INCOME_OF_WITHHOLD, JAN_TAXING_MARGIN_INCOME_OF_WITHHOLD, propsValueToString(value: testTaxingProp.marginIncomeOfWithhold)))
                            VECT_TAXING_MARGIN_INCOME_OF_SOLIDARY.append((testYear, MES_TAXING_MARGIN_INCOME_OF_SOLIDARY, JAN_TAXING_MARGIN_INCOME_OF_SOLIDARY, propsValueToString(value: testTaxingProp.marginIncomeOfSolidary)))
                            VECT_TAXING_MARGIN_INCOME_OF_TAXRATE2.append((testYear, MES_TAXING_MARGIN_INCOME_OF_TAXRATE2, JAN_TAXING_MARGIN_INCOME_OF_TAXRATE2, propsValueToString(value: testTaxingProp.marginIncomeOfTaxRate2)))
                            VECT_TAXING_MARGIN_INCOME_OF_WHT_EMP.append((testYear, MES_TAXING_MARGIN_INCOME_OF_WHT_EMP, JAN_TAXING_MARGIN_INCOME_OF_WHT_EMP, propsValueToString(value: testTaxingProp.marginIncomeOfWthEmp)))
                            VECT_TAXING_MARGIN_INCOME_OF_WHT_AGR.append((testYear, MES_TAXING_MARGIN_INCOME_OF_WHT_AGR, JAN_TAXING_MARGIN_INCOME_OF_WHT_AGR, propsValueToString(value: testTaxingProp.marginIncomeOfWthAgr)))

                        }

                        let tableData: Array<(Int16, Array<(Int16, Int16, String, String)>)> = [
                            (HEALTH_MIN_MONTHLY_BASIS, VECT_HEALTH_MIN_MONTHLY_BASIS),
                            (HEALTH_MAX_ANNUALS_BASIS, VECT_HEALTH_MAX_ANNUALS_BASIS),
                            (HEALTH_LIM_MONTHLY_STATE, VECT_HEALTH_LIM_MONTHLY_STATE),
                            (HEALTH_LIM_MONTHLY_DIS50, VECT_HEALTH_LIM_MONTHLY_DIS50),
                            (HEALTH_FACTOR_COMPOUND, VECT_HEALTH_FACTOR_COMPOUND),
                            (HEALTH_FACTOR_EMPLOYEE, VECT_HEALTH_FACTOR_EMPLOYEE),
                            (HEALTH_MARGIN_INCOME_EMP, VECT_HEALTH_MARGIN_INCOME_EMP),
                            (HEALTH_MARGIN_INCOME_AGR, VECT_HEALTH_MARGIN_INCOME_AGR),
                            (SALARY_WORKING_SHIFT_WEEK, VECT_SALARY_WORKING_SHIFT_WEEK),
                            (SALARY_WORKING_SHIFT_TIME, VECT_SALARY_WORKING_SHIFT_TIME),
                            (SALARY_MIN_MONTHLY_WAGE, VECT_SALARY_MIN_MONTHLY_WAGE),
                            (SALARY_MIN_HOURLY_WAGE, VECT_SALARY_MIN_HOURLY_WAGE),
                            (SOCIAL_MAX_ANNUALS_BASIS, VECT_SOCIAL_MAX_ANNUALS_BASIS),
                            (SOCIAL_FACTOR_EMPLOYER, VECT_SOCIAL_FACTOR_EMPLOYER),
                            (SOCIAL_FACTOR_EMPLOYER_HIGHER, VECT_SOCIAL_FACTOR_EMPLOYER_HIGHER),
                            (SOCIAL_FACTOR_EMPLOYEE, VECT_SOCIAL_FACTOR_EMPLOYEE),
                            (SOCIAL_FACTOR_EMPLOYEE_GARANT, VECT_SOCIAL_FACTOR_EMPLOYEE_GARANT),
                            (SOCIAL_FACTOR_EMPLOYEE_REDUCE, VECT_SOCIAL_FACTOR_EMPLOYEE_REDUCE),
                            (SOCIAL_MARGIN_INCOME_EMP, VECT_SOCIAL_MARGIN_INCOME_EMP),
                            (SOCIAL_MARGIN_INCOME_AGR, VECT_SOCIAL_MARGIN_INCOME_AGR),
                            (TAXING_ALLOWANCE_PAYER, VECT_TAXING_ALLOWANCE_PAYER),
                            (TAXING_ALLOWANCE_DISAB_1ST, VECT_TAXING_ALLOWANCE_DISAB_1ST),
                            (TAXING_ALLOWANCE_DISAB_2ND, VECT_TAXING_ALLOWANCE_DISAB_2ND),
                            (TAXING_ALLOWANCE_DISAB_3RD, VECT_TAXING_ALLOWANCE_DISAB_3RD),
                            (TAXING_ALLOWANCE_STUDY, VECT_TAXING_ALLOWANCE_STUDY),
                            (TAXING_ALLOWANCE_CHILD_1ST, VECT_TAXING_ALLOWANCE_CHILD_1ST),
                            (TAXING_ALLOWANCE_CHILD_2ND, VECT_TAXING_ALLOWANCE_CHILD_2ND),
                            (TAXING_ALLOWANCE_CHILD_3RD, VECT_TAXING_ALLOWANCE_CHILD_3RD),
                            (TAXING_FACTOR_ADVANCES, VECT_TAXING_FACTOR_ADVANCES),
                            (TAXING_FACTOR_WITHHOLD, VECT_TAXING_FACTOR_WITHHOLD),
                            (TAXING_FACTOR_SOLIDARY, VECT_TAXING_FACTOR_SOLIDARY),
                            (TAXING_FACTOR_TAXRATE2, VECT_TAXING_FACTOR_TAXRATE2),
                            (TAXING_MIN_AMOUNT_OF_TAXBONUS, VECT_TAXING_MIN_AMOUNT_OF_TAXBONUS),
                            (TAXING_MAX_AMOUNT_OF_TAXBONUS, VECT_TAXING_MAX_AMOUNT_OF_TAXBONUS),
                            (TAXING_MARGIN_INCOME_OF_TAXBONUS, VECT_TAXING_MARGIN_INCOME_OF_TAXBONUS),
                            (TAXING_MARGIN_INCOME_OF_ROUNDING, VECT_TAXING_MARGIN_INCOME_OF_ROUNDING),
                            (TAXING_MARGIN_INCOME_OF_WITHHOLD, VECT_TAXING_MARGIN_INCOME_OF_WITHHOLD),
                            (TAXING_MARGIN_INCOME_OF_SOLIDARY, VECT_TAXING_MARGIN_INCOME_OF_SOLIDARY),
                            (TAXING_MARGIN_INCOME_OF_TAXRATE2, VECT_TAXING_MARGIN_INCOME_OF_TAXRATE2),
                            (TAXING_MARGIN_INCOME_OF_WHT_EMP, VECT_TAXING_MARGIN_INCOME_OF_WHT_EMP),
                            (TAXING_MARGIN_INCOME_OF_WHT_AGR, VECT_TAXING_MARGIN_INCOME_OF_WHT_AGR),
                        ]

                        for data in tableData {
                            exportHistoryTerm(protokol: testProtokol, head: headerData, data: data)
                        }

                        closeHistoryFile(protokol: testProtokol)
                    } catch let loggerError {
                        print("Error: \(loggerError)".utf8)
                    }
                    #endif
                }
            }
        }
    }
}
#endif
