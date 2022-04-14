//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

protocol IProviderHealth: IPropsProvider {
    func minMonthlyBasis(_ period: IPeriod) -> Int32
    func maxAnnualsBasis(_ period: IPeriod) -> Int32
    func limMonthlyState(_ period: IPeriod) -> Int32
    func limMonthlyDis50(_ period: IPeriod) -> Int32
    func factorCompound(_ period: IPeriod) -> Decimal
    func factorEmployee(_ period: IPeriod) -> Decimal
    func marginIncomeEmp(_ period: IPeriod) -> Int32
    func marginIncomeAgr(_ period: IPeriod) -> Int32
}
