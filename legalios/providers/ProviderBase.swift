//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class ProviderBase {
    let version : VersionId

    init(versionId: VersionId) {
        self.version = versionId
    }

    convenience init(version: Int16) {
        self.init(versionId: VersionId.get(value: version))
    }

    func IsPeriodGreaterOrEqualThan(period: IPeriod, yearFrom: Int16, monthFrom: Int16) -> Bool {
        return (period.year > yearFrom || (period.year == yearFrom && period.month >= monthFrom))
    }
}
