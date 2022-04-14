//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

protocol IProviderFactory {
    associatedtype FP
    func getProps(_ period: IPeriod) -> FP
}
