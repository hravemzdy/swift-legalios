//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsTaxing2014 : PropsTaxingBase {
    override init(version: VersionId,
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

        super.init(version: version,
                allowancePayer: allowancePayer,
                allowanceDisab1st: allowanceDisab1st,
                allowanceDisab2nd: allowanceDisab2nd,
                allowanceDisab3rd: allowanceDisab3rd,
                allowanceStudy: allowanceStudy,
                allowanceChild1st: allowanceChild1st,
                allowanceChild2nd: allowanceChild2nd,
                allowanceChild3rd: allowanceChild3rd,
                factorAdvances: factorAdvances,
                factorWithhold: factorWithhold,
                factorSolidary: factorSolidary,
                factorTaxRate2: factorTaxRate2,
                minAmountOfTaxBonus: minAmountOfTaxBonus,
                maxAmountOfTaxBonus: maxAmountOfTaxBonus,
                marginIncomeOfTaxBonus: marginIncomeOfTaxBonus,
                marginIncomeOfRounding: marginIncomeOfRounding,
                marginIncomeOfWithhold: marginIncomeOfWithhold,
                marginIncomeOfSolidary: marginIncomeOfSolidary,
                marginIncomeOfTaxRate2: marginIncomeOfTaxRate2,
                marginIncomeOfWthEmp: marginIncomeOfWthEmp,
                marginIncomeOfWthAgr: marginIncomeOfWthAgr)
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

    static func empty() -> PropsTaxing2014 {
        return PropsTaxing2014(version: VERSION_ZERO)
    }

    override func hasWithholdIncome(termOpt: WorkTaxingTerms, signOpt: TaxDeclSignOption, noneOpt: TaxNoneSignOption, incomeSum: Int32) -> Bool {
        //*****************************************************************************
        // Tax income for advance from Year 2014 to Year 2017
        //*****************************************************************************
        // - withhold tax (non-signed declaration) and income
        // if (period.Year >= 2014 && period.Year =< 2017)
        // -- income from DPP is less than X CZK
        // -- income from statutory employment and non-resident is always withhold tax

        var withholdIncome: Bool = false
        if (signOpt != TaxDeclSignOption.DeclTaxNoSigned)
        {
            return false
        }
        if (noneOpt != TaxNoneSignOption.NosignTaxWithhold)
        {
            return false
        }
        if (termOpt == WorkTaxingTerms.TaxingTermAgreemTask)
        {
            if (marginIncomeOfWthAgr == 0 || incomeSum <= marginIncomeOfWthAgr)
            {
                if (incomeSum > 0)
                {
                    withholdIncome = true
                }
            }
        }
        else if (termOpt == WorkTaxingTerms.TaxingTermStatutPart)
        {
            if (incomeSum > 0)
            {
                withholdIncome = true
            }
        }
        return withholdIncome
    }

    override func roundedAdvancesPaym(supersResult: Int32, basisResult: Int32) -> Int32 {
        let factorAdvances = OperationsDec.divide(factorAdvances, div: Decimal(integerLiteral: 100))

        var advanceTaxing: Int32 = 0
        if (basisResult <= marginIncomeOfRounding)
        {
            advanceTaxing = intTaxRoundUp(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(supersResult)), mul: factorAdvances))
        }
        else
        {
            advanceTaxing = intTaxRoundUp(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(supersResult)), mul: factorAdvances))
        }

        return advanceTaxing
    }
}
