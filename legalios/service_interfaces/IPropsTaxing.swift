//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsTaxing : IProps {
    var allowancePayer: Int32 { get }
    var allowanceDisab1st: Int32 { get }
    var allowanceDisab2nd : Int32 { get }
    var allowanceDisab3rd: Int32 { get }
    var allowanceStudy: Int32 { get }
    var allowanceChild1st: Int32 { get }
    var allowanceChild2nd: Int32 { get }
    var allowanceChild3rd: Int32 { get }
    var factorAdvances: Decimal { get }
    var factorWithhold: Decimal { get }
    var factorSolidary: Decimal { get }
    var factorTaxRate2: Decimal { get }
    var minAmountOfTaxBonus: Int32 { get }
    var maxAmountOfTaxBonus: Int32 { get }
    var marginIncomeOfTaxBonus: Int32 { get }
    var marginIncomeOfRounding: Int32 { get }
    var marginIncomeOfWithhold: Int32 { get }
    var marginIncomeOfSolidary: Int32 { get }
    var marginIncomeOfTaxRate2: Int32 { get }
    var marginIncomeOfWthEmp: Int32 { get }
    var marginIncomeOfWthAgr: Int32 { get }

    func valueEquals(other: IPropsTaxing?) -> Bool
    func hasWithholdIncome(termOpt: WorkTaxingTerms,
        signOpt: TaxDeclSignOption, noneOpt: TaxNoneSignOption, incomeSum: Int32) -> Bool
    func benefitAllowancePayer(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclBenfOption) -> Int32
    func benefitAllowanceDisab(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclDisabOption) -> Int32
    func benefitAllowanceStudy(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclBenfOption) -> Int32
    func benefitAllowanceChild(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclBenfOption, benefitOrds: Int16, disabelOpts: Int16) -> Int32
    func bonusChildRaw(income: Int32, benefit: Int32, rebated: Int32) -> Int32
    func bonusChildFix(income: Int32, benefit: Int32, rebated: Int32) -> Int32
    func taxableIncomeSupers(incomeResult: Int32, healthResult: Int32, socialResult: Int32) -> Int32
    func taxableIncomeBasis(incomeResult: Int32) -> Int32
    func roundedBaseAdvances(incomeResult: Int32) -> Int32
    func roundedBaseAdvances(incomeResult: Int32, healthResult: Int32, socialResult: Int32) -> Int32
    func roundedBaseSolidary(incomeResult: Int32) -> Int32
    func roundedAdvancesPaym(supersResult: Int32, basisResult: Int32) -> Int32
    func roundedSolidaryPaym(basisResult: Int32) -> Int32
    func roundedBaseWithhold(incomeResult: Int32) -> Int32
    func roundedWithholdPaym(supersResult: Int32, basisResult: Int32) -> Int32
}
