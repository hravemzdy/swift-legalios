//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderTaxing2012: ProviderTaxing {
    init() {
        super.init(versionId: HistoryConstTaxing2012.VERSION_CODE)
    }

    override func getProps<P>(_ period: IPeriod) -> P {
        return PropsTaxing2010(version: version,
                allowancePayer: allowancePayer(period),
                allowanceDisab1st: allowanceDisab1st(period),
                allowanceDisab2nd: allowanceDisab2nd(period),
                allowanceDisab3rd: allowanceDisab3rd(period),
                allowanceStudy: allowanceStudy(period),
                allowanceChild1st: allowanceChild1st(period),
                allowanceChild2nd: allowanceChild2nd(period),
                allowanceChild3rd: allowanceChild3rd(period),
                factorAdvances: factorAdvances(period),
                factorWithhold: factorWithhold(period),
                factorSolidary: factorSolidary(period),
                factorTaxRate2: factorTaxRate2(period),
                minAmountOfTaxBonus: minAmountOfTaxBonus(period),
                maxAmountOfTaxBonus: maxAmountOfTaxBonus(period),
                marginIncomeOfTaxBonus: marginIncomeOfTaxBonus(period),
                marginIncomeOfRounding: marginIncomeOfRounding(period),
                marginIncomeOfWithhold: marginIncomeOfWithhold(period),
                marginIncomeOfSolidary: marginIncomeOfSolidary(period),
                marginIncomeOfTaxRate2: marginIncomeOfTaxRate2(period),
                marginIncomeOfWthEmp: marginIncomeOfWthEmp(period),
                marginIncomeOfWthAgr: marginIncomeOfWthAgr(period))  as! P
    }

    override func allowancePayer(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.ALLOWANCE_PAYER
    }

    override func allowanceDisab1st(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.ALLOWANCE_DISAB_1ST
    }

    override func allowanceDisab2nd(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.ALLOWANCE_DISAB_2ND
    }

    override func allowanceDisab3rd(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.ALLOWANCE_DISAB_3RD
    }

    override func allowanceStudy(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.ALLOWANCE_STUDY
    }

    override func allowanceChild1st(_ period: IPeriod) -> Int32  {
        return HistoryConstTaxing2012.ALLOWANCE_CHILD_1ST
    }

    override func allowanceChild2nd(_ period: IPeriod) -> Int32  {
        return HistoryConstTaxing2012.ALLOWANCE_CHILD_2ND
    }

    override func allowanceChild3rd(_ period: IPeriod) -> Int32  {
        return HistoryConstTaxing2012.ALLOWANCE_CHILD_3RD
    }

    override func factorAdvances(_ period: IPeriod) -> Decimal {
        return HistoryConstTaxing2012.FACTOR_ADVANCES
    }

    override func factorWithhold(_ period: IPeriod) -> Decimal {
        return HistoryConstTaxing2012.FACTOR_WITHHOLD
    }

    override func factorSolidary(_ period: IPeriod) -> Decimal {
        return HistoryConstTaxing2012.FACTOR_SOLIDARY
    }

    override func factorTaxRate2(_ period: IPeriod) -> Decimal {
        return HistoryConstTaxing2012.FACTOR_TAXRATE2
    }

    override func minAmountOfTaxBonus(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MIN_AMOUNT_OF_TAXBONUS
    }

    override func maxAmountOfTaxBonus(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MAX_AMOUNT_OF_TAXBONUS
    }

    override func marginIncomeOfTaxBonus(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MARGIN_INCOME_OF_TAXBONUS
    }

    override func marginIncomeOfRounding(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MARGIN_INCOME_OF_ROUNDING
    }

    override func marginIncomeOfWithhold(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MARGIN_INCOME_OF_WITHHOLD
    }

    override func marginIncomeOfSolidary(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MARGIN_INCOME_OF_SOLIDARY
    }

    override func marginIncomeOfTaxRate2(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MARGIN_INCOME_OF_TAXRATE2
    }

    override func marginIncomeOfWthEmp(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MARGIN_INCOME_OF_WHT_EMP
    }

    override func marginIncomeOfWthAgr(_ period: IPeriod) -> Int32 {
        return HistoryConstTaxing2012.MARGIN_INCOME_OF_WHT_AGR
    }
}
