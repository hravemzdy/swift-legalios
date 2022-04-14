//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

protocol IProviderSocial: IPropsProvider {
    func maxAnnualsBasis(_ period: IPeriod) -> Int32
    func factorEmployer(_ period: IPeriod) -> Decimal
    func factorEmployerHigher(_ period: IPeriod) -> Decimal
    func factorEmployee(_ period: IPeriod) -> Decimal
    func factorEmployeeGarant(_ period: IPeriod) -> Decimal
    func factorEmployeeReduce(_ period: IPeriod) -> Decimal
    func marginIncomeEmp(_ period: IPeriod) -> Int32
    func marginIncomeAgr(_ period: IPeriod) -> Int32
}
