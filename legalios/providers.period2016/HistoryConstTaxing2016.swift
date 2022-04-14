//
// Created by Ladislav Lisy on 13.06.2021.
//

// ALLOWANCE_PAYER                  Částka slevy na poplatníka
//
// ALLOWANCE_DISAB_1ST              Částka slevy na invaliditu 1.stupně poplatníka
//
// ALLOWANCE_DISAB_2ND              Částka slevy na invaliditu 2.stupně poplatníka
//
// ALLOWANCE_DISAB_3RD              Částka slevy na invaliditu 3.stupně poplatníka
//
// ALLOWANCE_STUDY                  Částka slevy na poplatníka studenta
//
// ALLOWANCE_CHILD_1ST              Částka slevy na dítě 1.pořadí
//
// ALLOWANCE_CHILD_2ND              Částka slevy na dítě 2.pořadí
//
// ALLOWANCE_CHILD_3RD              Částka slevy na dítě 3.pořadí
//
// FACTOR_ADVANCES                  Sazba daně na zálohový příjem
//
// FACTOR_WITHHOLD                  Sazba daně na srážkový příjem
//
// FACTOR_SOLIDARY                  Sazba daně na solidární zvýšení
//
// FACTOR_TAXRATE2                  Sazba daně pro druhé pásmo daně
//
// MIN_AMOUNT_OF_TAXBONUS           Minimální částka pro daňový bonus
//
// MAX_AMOUNT_OF_TAXBONUS           Maximální částka pro daňový bonus
//
// MARGIN_INCOME_OF_TAXBONUS        Minimální výše příjmu pro nároku na daňový bonus
//
// MARGIN_INCOME_OF_ROUNDING        Maximální výše příjmu pro zaokrouhlování
//
// MARGIN_INCOME_OF_WITHHOLD        Maximální výše příjmu pro srážkový příjem
//
// MARGIN_INCOME_OF_SOLIDARY        Minimální výše příjmu pro solidární zvýšení daně
//
// MARGIN_INCOME_OF_TAXRATE2        Minimální výše příjmu pro druhé pásmo daně
//
// MARGIN_INCOME_OF_WHT_AGR         hranice příjmu pro srážkovou daň pro zaměstnace v pracovním poměru (nepodepsal prohlášení)
//
// MARGIN_INCOME_OF_WHT_EMP         hranice příjmu pro srážkovou daň pro zaměstnace na dohodu (nepodepsal prohlášení)

import Foundation

struct HistoryConstTaxing2016var05
{
    static let ALLOWANCE_CHILD_2ND: Int32 = 1417
    static let ALLOWANCE_CHILD_3RD: Int32 = 1717
}

struct HistoryConstTaxing2016
{
    static let VERSION_CODE: Int16 = 2016

    static let ALLOWANCE_PAYER: Int32 = HistoryConstTaxing2015.ALLOWANCE_PAYER
    static let ALLOWANCE_DISAB_1ST: Int32 = HistoryConstTaxing2015.ALLOWANCE_DISAB_1ST
    static let ALLOWANCE_DISAB_2ND: Int32 = HistoryConstTaxing2015.ALLOWANCE_DISAB_2ND
    static let ALLOWANCE_DISAB_3RD: Int32 = HistoryConstTaxing2015.ALLOWANCE_DISAB_3RD
    static let ALLOWANCE_STUDY: Int32 = HistoryConstTaxing2015.ALLOWANCE_STUDY
    static let ALLOWANCE_CHILD_1ST: Int32 = HistoryConstTaxing2015.ALLOWANCE_CHILD_1ST
    static let ALLOWANCE_CHILD_2ND: Int32 = HistoryConstTaxing2015.ALLOWANCE_CHILD_2ND
    static let ALLOWANCE_CHILD_3RD: Int32 = HistoryConstTaxing2015.ALLOWANCE_CHILD_3RD
    static let FACTOR_ADVANCES: Decimal = HistoryConstTaxing2015.FACTOR_ADVANCES
    static let FACTOR_WITHHOLD: Decimal = HistoryConstTaxing2015.FACTOR_WITHHOLD
    static let FACTOR_SOLIDARY: Decimal = HistoryConstTaxing2015.FACTOR_SOLIDARY
    static let FACTOR_TAXRATE2: Decimal = HistoryConstTaxing2015.FACTOR_TAXRATE2
    static let MIN_AMOUNT_OF_TAXBONUS: Int32 = HistoryConstTaxing2015.MIN_AMOUNT_OF_TAXBONUS
    static let MAX_AMOUNT_OF_TAXBONUS: Int32 = HistoryConstTaxing2015.MAX_AMOUNT_OF_TAXBONUS
    static let MARGIN_INCOME_OF_TAXBONUS: Int32 = (HistoryConstSalary2016.MIN_MONTHLY_WAGE / 2)
    static let MARGIN_INCOME_OF_ROUNDING: Int32 = HistoryConstTaxing2015.MARGIN_INCOME_OF_ROUNDING
    static let MARGIN_INCOME_OF_WITHHOLD: Int32 = HistoryConstTaxing2015.MARGIN_INCOME_OF_WITHHOLD
    static let MARGIN_INCOME_OF_SOLIDARY: Int32 = (4 * 27006)
    static let MARGIN_INCOME_OF_TAXRATE2: Int32 = HistoryConstTaxing2015.MARGIN_INCOME_OF_TAXRATE2
    static let MARGIN_INCOME_OF_WHT_EMP: Int32 = HistoryConstTaxing2015.MARGIN_INCOME_OF_WHT_EMP
    static let MARGIN_INCOME_OF_WHT_AGR: Int32 = HistoryConstTaxing2015.MARGIN_INCOME_OF_WHT_AGR
}

