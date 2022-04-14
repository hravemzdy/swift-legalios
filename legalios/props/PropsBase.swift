//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsBase : IProps {
    public static let VERSION_ZERO : Int16 = 0

    let version : VersionId

    init(version: VersionId) {
        self.version = version
    }

    convenience init(versionId: Int16) {
        self.init(version: VersionId.get(value: versionId))
    }

    func isValid() -> Bool {
        return version.value != PropsBase.VERSION_ZERO
    }
}
