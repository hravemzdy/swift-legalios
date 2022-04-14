//
// Created by Ladislav Lisy on 29.06.2022.
//

import Foundation

class ProviderSalary2022 : ProviderSalary {
    init() {
        super.init(versionId: HistoryConstSalary2022.VERSION_CODE)
    }

    override func getProps<P>(_ period: IPeriod) -> P {
        return PropsSalary(version: version,
                workingShiftWeek : workingShiftWeek(period),
                workingShiftTime : workingShiftTime(period),
                minMonthlyWage : minMonthlyWage(period),
                minHourlyWage : minHourlyWage(period))  as! P
    }

    override func workingShiftWeek(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2022.WORKING_SHIFT_WEEK
    }

    override func workingShiftTime(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2022.WORKING_SHIFT_TIME
    }

    override func minMonthlyWage(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2022.MIN_MONTHLY_WAGE
    }

    override func minHourlyWage(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2022.MIN_HOURLY_WAGE
    }
}
