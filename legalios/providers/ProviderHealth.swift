//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderHealth: ProviderBase, IProviderHealth {
    typealias P = PropsHealthBase

    init(versionId: Int16) {
        super.init(versionId: VersionId.get(value: versionId))
    }

    func getProps<P>(_ period: IPeriod) -> P { return PropsHealth.empty() as! P }

    func minMonthlyBasis(_ period: IPeriod) -> Int32 {return 0}

    func maxAnnualsBasis(_ period: IPeriod) -> Int32 {return 0}

    func limMonthlyState(_ period: IPeriod) -> Int32 {return 0}

    func limMonthlyDis50(_ period: IPeriod) -> Int32 {return 0}

    func factorCompound(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorEmployee(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func marginIncomeEmp(_ period: IPeriod) -> Int32 {return 0}

    func marginIncomeAgr(_ period: IPeriod) -> Int32 {return 0}
}
