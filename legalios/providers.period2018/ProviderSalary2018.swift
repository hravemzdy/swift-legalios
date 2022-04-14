//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderSalary2018 : ProviderSalary {
    init() {
        super.init(versionId: HistoryConstSalary2018.VERSION_CODE)
    }

    override func getProps<P>(_ period: IPeriod) -> P {
        return PropsSalary(version: version,
                workingShiftWeek : workingShiftWeek(period),
                workingShiftTime : workingShiftTime(period),
                minMonthlyWage : minMonthlyWage(period),
                minHourlyWage : minHourlyWage(period))  as! P
    }

    override func workingShiftWeek(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2018.WORKING_SHIFT_WEEK
    }

    override func workingShiftTime(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2018.WORKING_SHIFT_TIME
    }

    override func minMonthlyWage(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2018.MIN_MONTHLY_WAGE
    }

    override func minHourlyWage(_ period: IPeriod) -> Int32 {
        return HistoryConstSalary2018.MIN_HOURLY_WAGE
    }
}
