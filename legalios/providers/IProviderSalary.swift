//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

protocol IProviderSalary: IPropsProvider {
    func workingShiftWeek(_ period: IPeriod) -> Int32
    func workingShiftTime(_ period: IPeriod) -> Int32
    func minMonthlyWage(_ period: IPeriod) -> Int32
    func minHourlyWage(_ period: IPeriod) -> Int32
}
