//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsTaxingBase : PropsBase, IPropsTaxing {
    let allowancePayer: Int32
    let allowanceDisab1st: Int32
    let allowanceDisab2nd : Int32
    let allowanceDisab3rd: Int32
    let allowanceStudy: Int32
    let allowanceChild1st: Int32
    let allowanceChild2nd: Int32
    let allowanceChild3rd: Int32
    let factorAdvances: Decimal
    let factorWithhold: Decimal
    let factorSolidary: Decimal
    let factorTaxRate2: Decimal
    let minAmountOfTaxBonus: Int32
    let maxAmountOfTaxBonus: Int32
    let marginIncomeOfTaxBonus: Int32
    let marginIncomeOfRounding: Int32
    let marginIncomeOfWithhold: Int32
    let marginIncomeOfSolidary: Int32
    let marginIncomeOfTaxRate2: Int32
    let marginIncomeOfWthEmp: Int32
    let marginIncomeOfWthAgr: Int32

    init(version: VersionId,
        allowancePayer: Int32,
        allowanceDisab1st: Int32,
        allowanceDisab2nd : Int32,
        allowanceDisab3rd: Int32,
        allowanceStudy: Int32,
        allowanceChild1st: Int32,
        allowanceChild2nd: Int32,
        allowanceChild3rd: Int32,
        factorAdvances: Decimal,
        factorWithhold: Decimal,
        factorSolidary: Decimal,
        factorTaxRate2: Decimal,
        minAmountOfTaxBonus: Int32,
        maxAmountOfTaxBonus: Int32,
        marginIncomeOfTaxBonus: Int32,
        marginIncomeOfRounding: Int32,
        marginIncomeOfWithhold: Int32,
        marginIncomeOfSolidary: Int32,
        marginIncomeOfTaxRate2: Int32,
        marginIncomeOfWthEmp: Int32,
        marginIncomeOfWthAgr: Int32) {
        self.allowancePayer = allowancePayer
        self.allowanceDisab1st = allowanceDisab1st
        self.allowanceDisab2nd = allowanceDisab2nd
        self.allowanceDisab3rd = allowanceDisab3rd
        self.allowanceStudy = allowanceStudy
        self.allowanceChild1st = allowanceChild1st
        self.allowanceChild2nd = allowanceChild2nd
        self.allowanceChild3rd = allowanceChild3rd
        self.factorAdvances = factorAdvances
        self.factorWithhold = factorWithhold
        self.factorSolidary = factorSolidary
        self.factorTaxRate2 = factorTaxRate2
        self.minAmountOfTaxBonus = minAmountOfTaxBonus
        self.maxAmountOfTaxBonus = maxAmountOfTaxBonus
        self.marginIncomeOfTaxBonus = marginIncomeOfTaxBonus
        self.marginIncomeOfRounding = marginIncomeOfRounding
        self.marginIncomeOfWithhold = marginIncomeOfWithhold
        self.marginIncomeOfSolidary = marginIncomeOfSolidary
        self.marginIncomeOfTaxRate2 = marginIncomeOfTaxRate2
        self.marginIncomeOfWthEmp = marginIncomeOfWthEmp
        self.marginIncomeOfWthAgr = marginIncomeOfWthAgr
        super.init(version: version)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                allowancePayer: 0,
                allowanceDisab1st: 0,
                allowanceDisab2nd: 0,
                allowanceDisab3rd: 0,
                allowanceStudy: 0,
                allowanceChild1st: 0,
                allowanceChild2nd: 0,
                allowanceChild3rd: 0,
                factorAdvances: Decimal.zero,
                factorWithhold: Decimal.zero,
                factorSolidary: Decimal.zero,
                factorTaxRate2: Decimal.zero,
                minAmountOfTaxBonus: 0,
                maxAmountOfTaxBonus: 0,
                marginIncomeOfTaxBonus: 0,
                marginIncomeOfRounding: 0,
                marginIncomeOfWithhold: 0,
                marginIncomeOfSolidary: 0,
                marginIncomeOfTaxRate2: 0,
                marginIncomeOfWthEmp: 0,
                marginIncomeOfWthAgr: 0)
    }

    func valueEquals(other: IPropsTaxing?) -> Bool {
        if (other == nil)
        {
            return false
        }
        return (self.allowancePayer == other?.allowancePayer &&
                self.allowanceDisab1st == other?.allowanceDisab1st &&
                self.allowanceDisab2nd == other?.allowanceDisab2nd &&
                self.allowanceDisab3rd == other?.allowanceDisab3rd &&
                self.allowanceStudy == other?.allowanceStudy &&
                self.allowanceChild1st == other?.allowanceChild1st &&
                self.allowanceChild2nd == other?.allowanceChild2nd &&
                self.allowanceChild3rd == other?.allowanceChild3rd &&
                self.factorAdvances == other?.factorAdvances &&
                self.factorWithhold == other?.factorWithhold &&
                self.factorSolidary == other?.factorSolidary &&
                self.factorTaxRate2 == other?.factorTaxRate2 &&
                self.minAmountOfTaxBonus == other?.minAmountOfTaxBonus &&
                self.maxAmountOfTaxBonus == other?.maxAmountOfTaxBonus &&
                self.marginIncomeOfTaxBonus == other?.marginIncomeOfTaxBonus &&
                self.marginIncomeOfRounding == other?.marginIncomeOfRounding &&
                self.marginIncomeOfWithhold == other?.marginIncomeOfWithhold &&
                self.marginIncomeOfSolidary == other?.marginIncomeOfSolidary &&
                self.marginIncomeOfTaxRate2 == other?.marginIncomeOfTaxRate2 &&
                self.marginIncomeOfWthEmp == other?.marginIncomeOfWthEmp &&
                self.marginIncomeOfWthAgr == other?.marginIncomeOfWthAgr)
    }

    func intTaxRoundUp(valueDec: Decimal) -> Int32 {
        return OperationsRound.roundUp(valueDec)
    }
    func intTaxRoundNearUp(valueDec: Decimal, nearest: Int32 = 100) -> Int32 {
        return OperationsRound.nearRoundUp(valueDec, nearest: nearest)
    }
    func intTaxRoundDown(valueDec: Decimal) -> Int32 {
        return OperationsRound.roundDown(valueDec)
    }
    func intTaxRoundNearDown(valueDec: Decimal, nearest: Int32 = 100) -> Int32 {
        return OperationsRound.nearRoundDown(valueDec, nearest: nearest)
    }

    func decTaxRoundUp(valueDec: Decimal) -> Decimal {
        return OperationsRound.decRoundUp(valueDec)
    }

    func decTaxRoundNearUp(valueDec: Decimal, nearest: Int32 = 100) -> Decimal {
        return OperationsRound.decNearRoundUp(valueDec, nearest: nearest)
    }
    func decTaxRoundDown(valueDec: Decimal) -> Decimal {
        return OperationsRound.decRoundDown(valueDec)
    }
    func decTaxRoundNearDown(valueDec: Decimal, nearest: Int32 = 100) -> Decimal {
        return OperationsRound.decNearRoundDown(valueDec, nearest: nearest)
    }

    func hasWithholdIncome(termOpt: WorkTaxingTerms, signOpt: TaxDeclSignOption, noneOpt: TaxNoneSignOption, incomeSum: Int32) -> Bool {
        preconditionFailure("This method must be overridden")
    }

    func benefitAllowancePayer(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclBenfOption) -> Int32 {
        var benefitValue: Int32 = 0
        if (signOpts == TaxDeclSignOption.DeclTaxDoSigned)
        {
            if (benefitOpts == TaxDeclBenfOption.DeclTaxBenef1)
            {
                benefitValue = allowancePayer
            }
        }
        return benefitValue
    }

    func benefitAllowanceDisab(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclDisabOption) -> Int32 {
        var benefitValue: Int32 = 0
        if (signOpts == TaxDeclSignOption.DeclTaxDoSigned)
        {
            benefitValue = 0
            switch (benefitOpts) {
            case TaxDeclDisabOption.DeclTaxDisab1:
                benefitValue = allowanceDisab1st
                break
            case TaxDeclDisabOption.DeclTaxDisab2:
                benefitValue = allowanceDisab2nd
                break
            case TaxDeclDisabOption.DeclTaxDisab3:
                benefitValue = allowanceDisab3rd
                break
            default:
                benefitValue = 0
                break
            }
        }
        return benefitValue
    }

    func benefitAllowanceStudy(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclBenfOption) -> Int32 {
        var benefitValue: Int32 = 0

        if (signOpts == TaxDeclSignOption.DeclTaxDoSigned)
        {
            if (benefitOpts == TaxDeclBenfOption.DeclTaxBenef1)
            {
                benefitValue = allowanceStudy
            }
        }
        return benefitValue
    }

    func benefitAllowanceChild(signOpts: TaxDeclSignOption, benefitOpts: TaxDeclBenfOption, benefitOrds: Int16, disabelOpts: Int16) -> Int32 {
        var benefitValue: Int32 = 0
        if (signOpts == TaxDeclSignOption.DeclTaxDoSigned)
        {
            var benefitUnits: Int32 = 0
            switch (benefitOrds) {
            case 0:
                benefitUnits = allowanceChild1st
                break
            case 1:
                benefitUnits = allowanceChild2nd
                break
            case 2:
                benefitUnits = allowanceChild3rd
                break
            default:
                benefitUnits = 0
        }
            if (benefitOpts == TaxDeclBenfOption.DeclTaxBenef1)
            {
                if (disabelOpts == 1)
                {
                    benefitValue = benefitUnits * 2
                }
                else
                {
                    benefitValue = benefitUnits
                }
            }
        }
        return benefitValue
    }

    func bonusChildRaw(income: Int32, benefit: Int32, rebated: Int32) -> Int32 {
        var bonusForChild: Decimal = Decimal(integerLiteral: min(0, Int(rebated - benefit)))
        bonusForChild.negate()

        if (marginIncomeOfTaxBonus > 0)
        {
            if (income < marginIncomeOfTaxBonus)
            {
                bonusForChild = Decimal.zero
            }
        }
        return OperationsRound.roundToInt(bonusForChild)
    }

    func bonusChildFix(income: Int32, benefit: Int32, rebated: Int32) -> Int32 {
        let childBonus = bonusChildRaw(income: income, benefit: benefit, rebated: rebated)

        if (minAmountOfTaxBonus > 0)
        {
            if (childBonus < minAmountOfTaxBonus)
            {
                return 0
            }
        }
        if (maxAmountOfTaxBonus > 0)
        {
            if (childBonus > maxAmountOfTaxBonus)
            {
                return maxAmountOfTaxBonus
            }
        }
        return childBonus
    }

    func taxableIncomeSupers(incomeResult: Int32, healthResult: Int32, socialResult: Int32) -> Int32 {
        return taxableIncomeBasis(incomeResult: incomeResult + healthResult + socialResult)
    }

    func taxableIncomeBasis(incomeResult: Int32) -> Int32 {
        let taxableSuper: Int32 = max(0, incomeResult)
        return taxableSuper
    }

    func roundedBaseAdvances(incomeResult: Int32) -> Int32 {
        let amountForCalc: Int32 = taxableIncomeBasis(incomeResult: incomeResult)

        var advanceBase: Int32 = 0
        if (amountForCalc <= marginIncomeOfRounding)
        {
            advanceBase = intTaxRoundUp(valueDec: Decimal(integerLiteral: Int(amountForCalc)))
        }
        else
        {
            advanceBase = intTaxRoundNearUp(valueDec: Decimal(integerLiteral: Int(amountForCalc)), nearest: 100)
        }
        return advanceBase
    }

    func roundedBaseAdvances(incomeResult: Int32, healthResult: Int32, socialResult: Int32) -> Int32 {
        let advanceBase = roundedBaseAdvances(incomeResult: incomeResult + healthResult + socialResult)

        return advanceBase
    }

    func roundedBaseSolidary(incomeResult: Int32) -> Int32 {
        var solidaryBase: Int32 = 0

        let taxableIncome: Int32 = max(0, incomeResult)
        if (marginIncomeOfSolidary != 0)
        {
            solidaryBase = max(0, taxableIncome - marginIncomeOfSolidary)
        }
        return solidaryBase
    }

    func roundedAdvancesPaym(supersResult: Int32, basisResult: Int32) -> Int32 {
        preconditionFailure("This method must be overridden")
    }

    func roundedSolidaryPaym(basisResult: Int32) -> Int32 {
        let factorSolidary = OperationsDec.divide(factorSolidary, div: Decimal(integerLiteral: 100))

        var solidaryTaxing: Int32 = 0
        if (marginIncomeOfSolidary != 0)
        {
            solidaryTaxing = intTaxRoundUp(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(basisResult)), mul: factorSolidary))
        }

        return solidaryTaxing
    }

    func roundedBaseWithhold(incomeResult: Int32) -> Int32 {
        let amountForCalc: Int32 = max(0, incomeResult)
        let withholdBase: Int32 = intTaxRoundDown(valueDec: Decimal(integerLiteral: Int(amountForCalc)))

        return withholdBase
    }

    func roundedWithholdPaym(supersResult: Int32, basisResult: Int32) -> Int32 {
        let factorWithhold = OperationsDec.divide(factorWithhold, div: Decimal(integerLiteral: 100))

        var withholdTaxing: Int32 = max(0, supersResult)
        if (withholdTaxing > 0)
        {
            withholdTaxing = intTaxRoundDown(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(supersResult)), mul: factorWithhold))
        }
        return withholdTaxing
    }
}
