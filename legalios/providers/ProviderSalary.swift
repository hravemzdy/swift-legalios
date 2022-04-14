//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderSalary: ProviderBase, IProviderSalary {
    typealias P = PropsSalary

    init(versionId: Int16) {
        super.init(versionId: VersionId.get(value: versionId))
    }

    func getProps<P>(_ period: IPeriod) -> P { return PropsSalary.empty() as! P }

    func workingShiftWeek(_ period: IPeriod) -> Int32 {return 0}

    func workingShiftTime(_ period: IPeriod) -> Int32 {return 0}

    func minMonthlyWage(_ period: IPeriod) -> Int32 {return 0}

    func minHourlyWage(_ period: IPeriod) -> Int32 {return 0}
}
