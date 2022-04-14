//
// Created by Ladislav Lisy on 30.06.2021.
//

import Foundation

public protocol IHistoryResultError : Error {

}

public enum HistoryResultError : IHistoryResultError {
    case bundleNoneError(_ message: String)
    case bundleNullError(_ message: String)
    case bundleEmptyError(_ message: String)
    case bundleInvalidError(_ message: String)
}

public extension HistoryResultError {
    static func CreateBundleNoneError() -> HistoryResultError {
        return .bundleNoneError("service hasn't returned bundle")
    }
    static func CreateBundleNullError() -> HistoryResultError {
        return .bundleNullError("service returned null bundle")
    }
    static func CreateBundleEmptyError() -> HistoryResultError {
        return .bundleEmptyError("service returned empty bundle")
    }
    static func CreateBundleInvalidError() -> HistoryResultError {
        return .bundleInvalidError("service returned invalid bundle")
    }
}

func ~=<E: IHistoryResultError & Equatable>(rhs: E, lhs: IHistoryResultError) -> Bool {
    return (lhs as? E) == rhs
}

