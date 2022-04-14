//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

protocol IBundleBuilder {
    func getBundle(_ period: IPeriod) -> IBundleProps?
}
