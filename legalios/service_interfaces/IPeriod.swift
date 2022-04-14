//
// Created by Ladislav Lisy on 13.06.2021.
//

import Foundation

public protocol IPeriod {
    var code: Int32 { get }
    var year: Int16 { get }
    var month: Int16 { get }
    func equals(other: IPeriod) -> Bool
}
