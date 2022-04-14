//
// Created by Ladislav Lisy on 13.06.2021.
//

import Foundation

public struct VersionId : Comparable, IVersionId {
    static let VERSION_ZERO: Int16 = 0

    public static func <(lhs: VersionId, rhs: VersionId) -> Bool {
        lhs.value < rhs.value
    }

    public typealias T = Int16

    init () {
        self.value = VersionId.VERSION_ZERO
    }

    init (_ value: Int16) {
        self.value = value
    }

    public static func new() -> VersionId {
        return VersionId(VersionId.VERSION_ZERO)
    }

    public static func get(value: Int16) -> VersionId {
        return VersionId(value)
    }

    public let value: Int16
}
