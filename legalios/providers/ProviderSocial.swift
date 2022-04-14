//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderSocial: ProviderBase, IProviderSocial {
    typealias P = PropsSocialBase

    init(versionId: Int16) {
        super.init(versionId: VersionId.get(value: versionId))
    }

    func getProps<P>(_ period: IPeriod) -> P { return PropsSocial.empty() as! P }

    func maxAnnualsBasis(_ period: IPeriod) -> Int32  {return 0}

    func factorEmployer(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorEmployerHigher(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorEmployee(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorEmployeeGarant(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorEmployeeReduce(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func marginIncomeEmp(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeAgr(_ period: IPeriod) -> Int32  {return 0}
}

