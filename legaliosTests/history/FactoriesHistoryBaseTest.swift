//
// Created by Ladislav Lisy on 01.03.2022.
//

import Foundation

let HISTORY_FOLDER_NAME = "test_history"
let PARENT_HISTORY_FOLDER_NAME = "legalios"

func createHistoryFile(fileName : String) throws -> FileHandle {
    let fm = FileManager.default
    var currPath = URL(string: fm.currentDirectoryPath)!
    while (currPath.lastPathComponent != PARENT_HISTORY_FOLDER_NAME && currPath.pathComponents.count != 1) {
        currPath = currPath.deletingLastPathComponent()
    }
    let basePath = currPath.appendingPathComponent(HISTORY_FOLDER_NAME)
    let fileURLs = basePath.appendingPathComponent(fileName).absoluteURL

    if !fm.fileExists(atPath: fileURLs.path) {
        fm.createFile(atPath: fileURLs.path, contents: Data("".utf8), attributes: nil)
    }

    let fileHandle = try FileHandle(forWritingTo: fileURLs)
    fileHandle.truncateFile(atOffset: 0)

    return fileHandle
}

func closeHistoryFile(protokol: FileHandle) {
    protokol.closeFile()
}

func exportHistoryStart(protokol: FileHandle, data: Array<(Int16, Bool)>) {
    protokol.write(Data("History Term".utf8))
    for col in data {
        if (col.1)
        {
            protokol.write(Data("\t\(col.0) Begin Value".utf8))
            protokol.write(Data("\t\(col.0) Change Month".utf8))
            protokol.write(Data("\t\(col.0) End Value".utf8))
        }
        else
        {
            protokol.write(Data("\t\(col.0) Value".utf8))
        }
    }
    protokol.write(Data("\n".utf8))
}

func exportHistoryTerm(protokol: FileHandle, head: Array<(Int16, Bool)>, data: (Int16, Array<(Int16, Int16, String, String)>)) {
    protokol.write(Data(historyTermName(termId: data.0).utf8))
    for col in data.1
    {
        let header = head.first {x in (x.0 == col.0) }
        var yearOfChange: Bool = false
        if (header != nil)
        {
            yearOfChange = header!.1
        }
        protokol.write(Data("\t\(col.2)".utf8))
        if (yearOfChange)
        {
            if (col.1 == 0)
            {
                protokol.write(Data("\t".utf8))
            }
            else
            {
                protokol.write(Data("\t\(col.1)".utf8))
            }
            protokol.write(Data("\t\(col.3)".utf8))
        }
    }
    protokol.write(Data("\n".utf8))
}

func historyTermName(termId: Int16) -> String {
    var returnName = "Unknown Term"
    switch (termId) {
    case HEALTH_MIN_MONTHLY_BASIS:
        returnName = "01_Health_01_MinMonthlyBasis"
        break
    case HEALTH_MAX_ANNUALS_BASIS:
        returnName = "01_Health_02_MaxAnnualsBasis"
        break
    case HEALTH_LIM_MONTHLY_STATE:
        returnName = "01_Health_03_LimMonthlyState"
        break
    case HEALTH_LIM_MONTHLY_DIS50:
        returnName = "01_Health_04_LimMonthlyDis50"
        break
    case HEALTH_FACTOR_COMPOUND:
        returnName = "01_Health_05_FactorCompound"
        break
    case HEALTH_FACTOR_EMPLOYEE:
        returnName = "01_Health_06_FactorEmployee"
        break
    case HEALTH_MARGIN_INCOME_EMP:
        returnName = "01_Health_07_MarginIncomeEmp"
        break
    case HEALTH_MARGIN_INCOME_AGR:
        returnName = "01_Health_08_MarginIncomeAgr"
        break
    case SALARY_WORKING_SHIFT_WEEK:
        returnName = "02_Salary_01_WorkingShiftWeek"
        break
    case SALARY_WORKING_SHIFT_TIME:
        returnName = "02_Salary_02_WorkingShiftTime"
        break
    case SALARY_MIN_MONTHLY_WAGE:
        returnName = "02_Salary_03_MinMonthlyWage"
        break
    case SALARY_MIN_HOURLY_WAGE:
        returnName = "02_Salary_04_MinHourlyWage"
        break
    case SOCIAL_MAX_ANNUALS_BASIS:
        returnName = "03_Social_01_MaxAnnualsBasis"
        break
    case SOCIAL_FACTOR_EMPLOYER:
        returnName = "03_Social_02_FactorEmployer"
        break
    case SOCIAL_FACTOR_EMPLOYER_HIGHER:
        returnName = "03_Social_03_FactorEmployerHigher"
        break
    case SOCIAL_FACTOR_EMPLOYEE:
        returnName = "03_Social_04_FactorEmployee"
        break
    case SOCIAL_FACTOR_EMPLOYEE_GARANT:
        returnName = "03_Social_05_FactorEmployeeGarant"
        break
    case SOCIAL_FACTOR_EMPLOYEE_REDUCE:
        returnName = "03_Social_06_FactorEmployeeReduce"
        break
    case SOCIAL_MARGIN_INCOME_EMP:
        returnName = "03_Social_07_MarginIncomeEmp"
        break
    case SOCIAL_MARGIN_INCOME_AGR:
        returnName = "03_Social_08_MarginIncomeAgr"
        break
    case TAXING_ALLOWANCE_PAYER:
        returnName = "04_Taxing_01_AllowancePayer"
        break
    case TAXING_ALLOWANCE_DISAB_1ST:
        returnName = "04_Taxing_02_AllowanceDisab1st"
        break
    case TAXING_ALLOWANCE_DISAB_2ND:
        returnName = "04_Taxing_03_AllowanceDisab2nd"
        break
    case TAXING_ALLOWANCE_DISAB_3RD:
        returnName = "04_Taxing_04_AllowanceDisab3rd"
        break
    case TAXING_ALLOWANCE_STUDY:
        returnName = "04_Taxing_05_AllowanceStudy"
        break
    case TAXING_ALLOWANCE_CHILD_1ST:
        returnName = "04_Taxing_06_AllowanceChild1st"
        break
    case TAXING_ALLOWANCE_CHILD_2ND:
        returnName = "04_Taxing_07_AllowanceChild2nd"
        break
    case TAXING_ALLOWANCE_CHILD_3RD:
        returnName = "04_Taxing_08_AllowanceChild3rd"
        break
    case TAXING_FACTOR_ADVANCES:
        returnName = "04_Taxing_09_FactorAdvances"
        break
    case TAXING_FACTOR_WITHHOLD:
        returnName = "04_Taxing_10_FactorWithhold"
        break
    case TAXING_FACTOR_SOLIDARY:
        returnName = "04_Taxing_11_FactorSolidary"
        break
    case TAXING_FACTOR_TAXRATE2:
        returnName = "04_Taxing_12_FactorTaxRate2"
        break
    case TAXING_MIN_AMOUNT_OF_TAXBONUS:
        returnName = "04_Taxing_13_MinAmountOfTaxBonus"
        break
    case TAXING_MAX_AMOUNT_OF_TAXBONUS:
        returnName = "04_Taxing_14_MaxAmountOfTaxBonus"
        break
    case TAXING_MARGIN_INCOME_OF_TAXBONUS:
        returnName = "04_Taxing_15_MarginIncomeOfTaxBonus"
        break
    case TAXING_MARGIN_INCOME_OF_ROUNDING:
        returnName = "04_Taxing_16_MarginIncomeOfRounding"
        break
    case TAXING_MARGIN_INCOME_OF_WITHHOLD:
        returnName = "04_Taxing_17_MarginIncomeOfWithhold"
        break
    case TAXING_MARGIN_INCOME_OF_SOLIDARY:
        returnName = "04_Taxing_18_MarginIncomeOfSolidary"
        break
    case TAXING_MARGIN_INCOME_OF_TAXRATE2:
        returnName = "04_Taxing_18_MarginIncomeOfTaxRate2"
        break
    case TAXING_MARGIN_INCOME_OF_WHT_EMP:
        returnName = "04_Taxing_20_MarginIncomeOfWthEmp"
        break
    case TAXING_MARGIN_INCOME_OF_WHT_AGR:
        returnName = "04_Taxing_21_MarginIncomeOfWthAgr"
        break
    default:
        returnName = "Unknown Term"
        break
    }
    return returnName
}

func historyTermNameCZ(termId: Int16) -> String {
    var returnName = "Neznámý Termín"
    switch (termId)
    {
    case HEALTH_MIN_MONTHLY_BASIS:
        returnName = "01_Health_01 Minimální základ zdravotního pojištění na jednoho pracovníka"
        break
    case HEALTH_MAX_ANNUALS_BASIS:
        returnName = "01_Health_02 Maximální roční vyměřovací základ na jednoho pracovníka (tzv.strop)"
        break
    case HEALTH_LIM_MONTHLY_STATE:
        returnName = "01_Health_03 Vyměřovací základ ze kterého platí pojistné stát za státní pojištěnce (mateřská, studenti, důchodci)"
        break
    case HEALTH_LIM_MONTHLY_DIS50:
        returnName = "01_Health_04 Vyměřovací základ ze kterého platí pojistné stát za státní pojištěnce (mateřská, studenti, důchodci) u zaměstnavatele zaměstnávajícího více než 50% osob OZP"
        break
    case HEALTH_FACTOR_COMPOUND:
        returnName = "01_Health_05 složená sazba zdravotního pojištění (zaměstnace + zaměstnavatele)"
        break
    case HEALTH_FACTOR_EMPLOYEE:
        returnName = "01_Health_06 podíl sazby zdravotního pojištění připadajícího na zaměstnace (1/FACTOR_EMPLOYEE)"
        break
    case HEALTH_MARGIN_INCOME_EMP:
        returnName = "01_Health_07 hranice příjmu pro vznik účasti na pojištění pro zaměstnace v pracovním poměru"
        break
    case HEALTH_MARGIN_INCOME_AGR:
        returnName = "01_Health_08 hranice příjmu pro vznik účasti na pojištění pro zaměstnace na dohodu"
        break
    case SALARY_WORKING_SHIFT_WEEK:
        returnName = "02_Salary_01 Počet pracovních dnů v týdnu"
        break
    case SALARY_WORKING_SHIFT_TIME:
        returnName = "02_Salary_02 Počet pracovních hodin denně"
        break
    case SALARY_MIN_MONTHLY_WAGE:
        returnName = "02_Salary_03 Minimální mzda měsíční"
        break
    case SALARY_MIN_HOURLY_WAGE:
        returnName = "02_Salary_04 Minimální mzda hodinová (100*Kč)"
        break
    case SOCIAL_MAX_ANNUALS_BASIS:
        returnName = "03_Social_01 Maximální roční vyměřovací základ na jednoho pracovníka (tzv.strop)"
        break
    case SOCIAL_FACTOR_EMPLOYER:
        returnName = "03_Social_02 Sazba - standardní sociálního pojištění - zaměstnavatele"
        break
    case SOCIAL_FACTOR_EMPLOYER_HIGHER:
        returnName = "03_Social_03 Sazba - vyší sociálního pojištění - zaměstnavatele"
        break
    case SOCIAL_FACTOR_EMPLOYEE:
        returnName = "03_Social_04 Sazba sociálního pojištění - zaměstnance"
        break
    case SOCIAL_FACTOR_EMPLOYEE_GARANT:
        returnName = "03_Social_05 Sazba důchodového spoření - zaměstnance - s důchodovým spořením"
        break
    case SOCIAL_FACTOR_EMPLOYEE_REDUCE:
        returnName = "03_Social_06 Snížení sazby sociálního pojištění - zaměstnance - s důchodovým spořením"
        break
    case SOCIAL_MARGIN_INCOME_EMP:
        returnName = "03_Social_07 hranice příjmu pro vznik účasti na pojištění pro zaměstnace v pracovním poměru"
        break
    case SOCIAL_MARGIN_INCOME_AGR:
        returnName = "03_Social_08 hranice příjmu pro vznik účasti na pojištění pro zaměstnace na dohodu"
        break
    case TAXING_ALLOWANCE_PAYER:
        returnName = "04_Taxing_01 Částka slevy na poplatníka"
        break
    case TAXING_ALLOWANCE_DISAB_1ST:
        returnName = "04_Taxing_02 Částka slevy na invaliditu 1.stupně poplatníka"
        break
    case TAXING_ALLOWANCE_DISAB_2ND:
        returnName = "04_Taxing_03 Částka slevy na invaliditu 2.stupně poplatníka"
        break
    case TAXING_ALLOWANCE_DISAB_3RD:
        returnName = "04_Taxing_04 Částka slevy na invaliditu 3.stupně poplatníka"
        break
    case TAXING_ALLOWANCE_STUDY:
        returnName = "04_Taxing_05 Částka slevy na poplatníka studenta"
        break
    case TAXING_ALLOWANCE_CHILD_1ST:
        returnName = "04_Taxing_06 Částka slevy na dítě 1.pořadí"
        break
    case TAXING_ALLOWANCE_CHILD_2ND:
        returnName = "04_Taxing_07 Částka slevy na dítě 2.pořadí"
        break
    case TAXING_ALLOWANCE_CHILD_3RD:
        returnName = "04_Taxing_08 Částka slevy na dítě 3.pořadí"
        break
    case TAXING_FACTOR_ADVANCES:
        returnName = "04_Taxing_09 Sazba daně na zálohový příjem"
        break
    case TAXING_FACTOR_WITHHOLD:
        returnName = "04_Taxing_10 Sazba daně na srážkový příjem"
        break
    case TAXING_FACTOR_SOLIDARY:
        returnName = "04_Taxing_11 Sazba daně na solidární zvýšení"
        break
    case TAXING_FACTOR_TAXRATE2:
        returnName = "04_Taxing_12 Sazba daně pro druhé pásmo daně"
        break
    case TAXING_MIN_AMOUNT_OF_TAXBONUS:
        returnName = "04_Taxing_13 Minimální částka pro daňový bonus"
        break
    case TAXING_MAX_AMOUNT_OF_TAXBONUS:
        returnName = "04_Taxing_14 Maximální částka pro daňový bonus"
        break
    case TAXING_MARGIN_INCOME_OF_TAXBONUS:
        returnName = "04_Taxing_15 Minimální výše příjmu pro nároku na daňový bonus"
        break
    case TAXING_MARGIN_INCOME_OF_ROUNDING:
        returnName = "04_Taxing_16 Maximální výše příjmu pro zaokrouhlování"
        break
    case TAXING_MARGIN_INCOME_OF_WITHHOLD:
        returnName = "04_Taxing_17 Maximální výše příjmu pro srážkový příjem"
        break
    case TAXING_MARGIN_INCOME_OF_SOLIDARY:
        returnName = "04_Taxing_18 Minimální výše příjmu pro solidární zvýšení daně"
        break
    case TAXING_MARGIN_INCOME_OF_TAXRATE2:
        returnName = "04_Taxing_18 Minimální výše příjmu pro druhé pásmo daně"
        break
    case TAXING_MARGIN_INCOME_OF_WHT_EMP:
        returnName = "04_Taxing_20 hranice příjmu pro srážkovou daň pro zaměstnace v pracovním poměru (nepodepsal prohlášení)"
        break
    case TAXING_MARGIN_INCOME_OF_WHT_AGR:
        returnName = "04_Taxing_21 hranice příjmu pro srážkovou daň pro zaměstnace na dohodu (nepodepsal prohlášení)"
        break
   default:
        returnName = "Neznámý Termín"
        break
    }
    return returnName
}
func propsValueToString(value: Int32) -> String {
    return "\(value)"
}

func propsValueToString(value: Decimal) -> String {
    let intValue: Int32 = Int32(NSDecimalNumber(decimal: value*Decimal(integerLiteral: 100)).intValue)
    return "\(intValue)"
}



let HEALTH_MIN_MONTHLY_BASIS        :Int16 = 101
let HEALTH_MAX_ANNUALS_BASIS        :Int16 = 102
let HEALTH_LIM_MONTHLY_STATE        :Int16 = 103
let HEALTH_LIM_MONTHLY_DIS50        :Int16 = 104
let HEALTH_FACTOR_COMPOUND          :Int16 = 105
let HEALTH_FACTOR_EMPLOYEE          :Int16 = 106
let HEALTH_MARGIN_INCOME_EMP        :Int16 = 107
let HEALTH_MARGIN_INCOME_AGR        :Int16 = 108

let SALARY_WORKING_SHIFT_WEEK       :Int16 = 201
let SALARY_WORKING_SHIFT_TIME       :Int16 = 202
let SALARY_MIN_MONTHLY_WAGE         :Int16 = 203
let SALARY_MIN_HOURLY_WAGE          :Int16 = 204

let SOCIAL_MAX_ANNUALS_BASIS        :Int16 = 301
let SOCIAL_FACTOR_EMPLOYER          :Int16 = 302
let SOCIAL_FACTOR_EMPLOYER_HIGHER   :Int16 = 303
let SOCIAL_FACTOR_EMPLOYEE          :Int16 = 304
let SOCIAL_FACTOR_EMPLOYEE_GARANT   :Int16 = 305
let SOCIAL_FACTOR_EMPLOYEE_REDUCE   :Int16 = 306
let SOCIAL_MARGIN_INCOME_EMP        :Int16 = 307
let SOCIAL_MARGIN_INCOME_AGR        :Int16 = 308

let TAXING_ALLOWANCE_PAYER          :Int16 = 401
let TAXING_ALLOWANCE_DISAB_1ST      :Int16 = 402
let TAXING_ALLOWANCE_DISAB_2ND      :Int16 = 403
let TAXING_ALLOWANCE_DISAB_3RD      :Int16 = 404
let TAXING_ALLOWANCE_STUDY          :Int16 = 405
let TAXING_ALLOWANCE_CHILD_1ST      :Int16 = 406
let TAXING_ALLOWANCE_CHILD_2ND      :Int16 = 407
let TAXING_ALLOWANCE_CHILD_3RD      :Int16 = 408
let TAXING_FACTOR_ADVANCES          :Int16 = 409
let TAXING_FACTOR_WITHHOLD          :Int16 = 410
let TAXING_FACTOR_SOLIDARY          :Int16 = 411
let TAXING_FACTOR_TAXRATE2          :Int16 = 412
let TAXING_MIN_AMOUNT_OF_TAXBONUS   :Int16 = 413
let TAXING_MAX_AMOUNT_OF_TAXBONUS   :Int16 = 414
let TAXING_MARGIN_INCOME_OF_TAXBONUS:Int16 = 415
let TAXING_MARGIN_INCOME_OF_ROUNDING:Int16 = 416
let TAXING_MARGIN_INCOME_OF_WITHHOLD:Int16 = 417
let TAXING_MARGIN_INCOME_OF_SOLIDARY:Int16 = 418
let TAXING_MARGIN_INCOME_OF_TAXRATE2:Int16 = 419
let TAXING_MARGIN_INCOME_OF_WHT_EMP :Int16 = 420
let TAXING_MARGIN_INCOME_OF_WHT_AGR :Int16 = 421

