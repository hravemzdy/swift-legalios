//
// Created by Ladislav Lisy on 29.06.2013.
//

import Foundation

class ProviderHealth2013 : ProviderHealth {
    init() {
        super.init(versionId: HistoryConstHealth2013.VERSION_CODE)
    }

    override func getProps<P>(_ period: IPeriod) -> P {
        return PropsHealth2012(version: version,
                minMonthlyBasis: minMonthlyBasis(period),
                maxAnnualsBasis: maxAnnualsBasis(period),
                limMonthlyState: limMonthlyState(period),
                limMonthlyDis50: limMonthlyDis50(period),
                factorCompound: factorCompound(period),
                factorEmployee: factorEmployee(period),
                marginIncomeEmp: marginIncomeEmp(period),
                marginIncomeAgr: marginIncomeAgr(period)) as! P }

    override func minMonthlyBasis(_ period: IPeriod) -> Int32 {
        if (IsPeriodGreaterOrEqualThan(period: period, yearFrom: 2013, monthFrom: 8)) {
            return HistoryConstHealth2013var08.MIN_MONTHLY_BASIS
        }
        return HistoryConstHealth2013.MIN_MONTHLY_BASIS
    }

    override func maxAnnualsBasis(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2013.MAX_ANNUALS_BASIS
    }

    override func limMonthlyState(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2013.LIM_MONTHLY_STATE
    }

    override func limMonthlyDis50(_ period: IPeriod) -> Int32 {
        if (IsPeriodGreaterOrEqualThan(period: period, yearFrom: 2013, monthFrom: 11)) {
            return HistoryConstHealth2013var11.LIM_MONTHLY_DIS50
        }
        return HistoryConstHealth2013.LIM_MONTHLY_DIS50
    }

    override func factorCompound(_ period: IPeriod) -> Decimal {
        return HistoryConstHealth2013.FACTOR_COMPOUND
    }

    override func factorEmployee(_ period: IPeriod) -> Decimal {
        return HistoryConstHealth2013.FACTOR_EMPLOYEE
    }

    override func marginIncomeEmp(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2013.MARGIN_INCOME_EMP
    }

    override func marginIncomeAgr(_ period: IPeriod) -> Int32 {
        return HistoryConstHealth2013.MARGIN_INCOME_AGR
    }
}
