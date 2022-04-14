//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

protocol IPropsProvider {
    associatedtype P : IProps
    func getProps<P>(_ period: IPeriod) -> P
    var version: VersionId { get }
}