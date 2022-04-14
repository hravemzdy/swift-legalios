//
// Created by Ladislav Lisy on 13.06.2021.
//

// MAX_ANNUALS_BASIS            Maximální roční vyměřovací základ na jednoho pracovníka (tzv.strop)
//
// FACTOR_EMPLOYER              Sazba - standardní sociálního pojištění - zaměstnavatele
//
// FACTOR_EMPLOYER_HIGHER       Sazba - vyší sociálního pojištění - zaměstnavatele
//
// FACTOR_EMPLOYEE              Sazba sociálního pojištění - zaměstnance
//
// FACTOR_EMPLOYEE_REDUCE       Snížení sazby sociálního pojištění - zaměstnance - s důchodovým spořením
//
// FACTOR_EMPLOYEE_GARANT       Sazba důchodového spoření - zaměstnance - s důchodovým spořením
//
// MARGIN_INCOME_EMP            hranice příjmu pro vznik účasti na pojištění pro zaměstnace v pracovním poměru
//
// MARGIN_INCOME_AGR            hranice příjmu pro vznik účasti na pojištění pro zaměstnace na dohodu

import Foundation

struct HistoryConstSocial2013var02
{
    static let FACTOR_EMPLOYEE_REDUCE: Decimal =  Decimal(string: "3.0")!
    static let FACTOR_EMPLOYEE_GARANT: Decimal =  Decimal(string: "5.0")!
}

struct HistoryConstSocial2013
{
    static let VERSION_CODE: Int16 = 2013

    static let MAX_ANNUALS_BASIS: Int32 = 1242432
    static let FACTOR_EMPLOYER: Decimal = HistoryConstSocial2012.FACTOR_EMPLOYER
    static let FACTOR_EMPLOYER_HIGHER: Decimal = HistoryConstSocial2012.FACTOR_EMPLOYER_HIGHER
    static let FACTOR_EMPLOYEE: Decimal = HistoryConstSocial2012.FACTOR_EMPLOYEE
    static let FACTOR_EMPLOYEE_REDUCE: Decimal = HistoryConstSocial2012.FACTOR_EMPLOYEE_REDUCE
    static let FACTOR_EMPLOYEE_GARANT: Decimal = HistoryConstSocial2012.FACTOR_EMPLOYEE_GARANT
    static let MARGIN_INCOME_EMP: Int32 = HistoryConstSocial2012.MARGIN_INCOME_EMP
    static let MARGIN_INCOME_AGR: Int32 = HistoryConstSocial2012.MARGIN_INCOME_AGR
}

