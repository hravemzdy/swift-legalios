//
// Created by Ladislav Lisy on 29.06.2011.
//

import Foundation

class ProviderHealth2010: ProviderHealth {
    init() {
        super.init(versionId: HistoryConstHealth2010.VERSION_CODE)
    }

    override func getProps<P>(_ period: IPeriod) -> P {
        return PropsHealth2010(version: version,
                minMonthlyBasis: minMonthlyBasis(period),
                maxAnnualsBasis: maxAnnualsBasis(period),
                limMonthlyState: limMonthlyState(period),
                limMonthlyDis50: limMonthlyDis50(period),
                factorCompound: factorCompound(period),
                factorEmployee: factorEmployee(period),
                marginIncomeEmp: marginIncomeEmp(period),
                marginIncomeAgr: marginIncomeAgr(period)) as! P }

    override func minMonthlyBasis(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2010.MIN_MONTHLY_BASIS
    }

    override func maxAnnualsBasis(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2010.MAX_ANNUALS_BASIS
    }

    override func limMonthlyState(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2010.LIM_MONTHLY_STATE
    }

    override func limMonthlyDis50(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2010.LIM_MONTHLY_DIS50
    }

    override func factorCompound(_ period: IPeriod) -> Decimal {
        return HistoryConstHealth2010.FACTOR_COMPOUND
    }

    override func factorEmployee(_ period: IPeriod) -> Decimal {
        return HistoryConstHealth2010.FACTOR_EMPLOYEE
    }

    override func marginIncomeEmp(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2010.MARGIN_INCOME_EMP
    }

    override func marginIncomeAgr(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2010.MARGIN_INCOME_AGR
    }
}
