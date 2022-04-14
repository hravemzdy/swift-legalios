//
// Created by Ladislav Lisy on 13.06.2021.
//

// MIN_MONTHLY_BASIS     Minimální základ zdravotního pojištění na jednoho pracovníka
//
// MAX_ANNUALS_BASIS     Maximální roční vyměřovací základ na jednoho pracovníka (tzv.strop)
//
// LIM_MONTHLY_STATE     Vyměřovací základ ze kterého platí pojistné stát za státní pojištěnce (mateřská, studenti, důchodci)
//
// LIM_MONTHLY_DIS50     Vyměřovací základ ze kterého platí pojistné stát za státní pojištěnce (mateřská, studenti, důchodci)
//                      u zaměstnavatele zaměstnávajícího více než 50% osob OZP
// FACTOR_COMPOUND       složená sazba zdravotního pojištění (zaměstnace + zaměstnavatele)
//
// FACTOR_EMPLOYEE       podíl sazby zdravotního pojištění připadajícího na zaměstnace (1/FACTOR_EMPLOYEE)
//
// MARGIN_INCOME_EMP     hranice příjmu pro vznik účasti na pojištění pro zaměstnace v pracovním poměru
//
// MARGIN_INCOME_AGR     hranice příjmu pro vznik účasti na pojištění pro zaměstnace na dohodu

import Foundation

struct HistoryConstHealth2021
{
    static let VERSION_CODE: Int16 = 2021

    static let MIN_MONTHLY_BASIS: Int32 = HistoryConstSalary2021.MIN_MONTHLY_WAGE
    static let MAX_ANNUALS_BASIS: Int32 = HistoryConstHealth2020.MAX_ANNUALS_BASIS
    static let LIM_MONTHLY_STATE: Int32 = HistoryConstHealth2020.LIM_MONTHLY_STATE
    static let LIM_MONTHLY_DIS50: Int32 = 13088
    static let FACTOR_COMPOUND: Decimal = HistoryConstHealth2020.FACTOR_COMPOUND
    static let FACTOR_EMPLOYEE: Decimal = HistoryConstHealth2020.FACTOR_EMPLOYEE
    static let MARGIN_INCOME_EMP: Int32 = 3500
    static let MARGIN_INCOME_AGR: Int32 = HistoryConstHealth2020.MARGIN_INCOME_AGR
}

