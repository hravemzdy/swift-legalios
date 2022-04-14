//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderSocial2019 : ProviderSocial {
    init() {
        super.init(versionId: HistoryConstSocial2019.VERSION_CODE)
    }

    override func getProps<P>(_ period: IPeriod) -> P {
        return PropsSocial(version: version,
                maxAnnualsBasis: maxAnnualsBasis(period),
                factorEmployer: factorEmployer(period),
                factorEmployerHigher: factorEmployerHigher(period),
                factorEmployee: factorEmployee(period),
                factorEmployeeGarant: factorEmployeeGarant(period),
                factorEmployeeReduce: factorEmployeeReduce(period),
                marginIncomeEmp: marginIncomeEmp(period),
                marginIncomeAgr: marginIncomeAgr(period)) as! P
    }

    override func maxAnnualsBasis(_ period: IPeriod) -> Int32 {
        return HistoryConstSocial2019.MAX_ANNUALS_BASIS
    }

    override func factorEmployer(_ period: IPeriod) -> Decimal {
        if (IsPeriodGreaterOrEqualThan(period: period, yearFrom: 2019, monthFrom: 7)) {
            return HistoryConstSocial2019var07.FACTOR_EMPLOYER
        }
        return HistoryConstSocial2019.FACTOR_EMPLOYER
    }

    override func factorEmployerHigher(_ period: IPeriod) -> Decimal {
        return HistoryConstSocial2019.FACTOR_EMPLOYER_HIGHER
    }

    override func factorEmployee(_ period: IPeriod) -> Decimal {
        return HistoryConstSocial2019.FACTOR_EMPLOYEE
    }

    override func factorEmployeeGarant(_ period: IPeriod) -> Decimal {
        return HistoryConstSocial2019.FACTOR_EMPLOYEE_GARANT
    }

    override func factorEmployeeReduce(_ period: IPeriod) -> Decimal {
        return HistoryConstSocial2019.FACTOR_EMPLOYEE_REDUCE
    }

    override func marginIncomeEmp(_ period: IPeriod) -> Int32 {
        return HistoryConstSocial2019.MARGIN_INCOME_EMP
    }

    override func marginIncomeAgr(_ period: IPeriod) -> Int32 {
        return HistoryConstSocial2019.MARGIN_INCOME_AGR
    }
}
