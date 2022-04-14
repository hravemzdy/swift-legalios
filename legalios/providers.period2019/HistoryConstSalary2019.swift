//
// Created by Ladislav Lisy on 13.06.2021.
//

// WORKING_SHIFT_WEEK      Počet pracovních dnů v týdnu
//
// WORKING_SHIFT_TIME      Počet pracovních hodin denně
//
// MIN_MONTHLY_WAGE        Minimální mzda měsíční
//
// MIN_HOURLY_WAGE         Minimální mzda hodinová (100*Kč)

import Foundation

struct HistoryConstSalary2019
{
    static let VERSION_CODE: Int16 = 2019

    static let WORKING_SHIFT_WEEK: Int32 = HistoryConstSalary2018.WORKING_SHIFT_WEEK
    static let WORKING_SHIFT_TIME: Int32 = HistoryConstSalary2018.WORKING_SHIFT_TIME
    static let MIN_MONTHLY_WAGE: Int32   = 13350
    static let MIN_HOURLY_WAGE: Int32    = 7980
}

