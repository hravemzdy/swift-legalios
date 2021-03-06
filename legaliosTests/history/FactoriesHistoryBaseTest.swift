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
    var returnName = "Nezn??m?? Term??n"
    switch (termId)
    {
    case HEALTH_MIN_MONTHLY_BASIS:
        returnName = "01_Health_01 Minim??ln?? z??klad zdravotn??ho poji??t??n?? na jednoho pracovn??ka"
        break
    case HEALTH_MAX_ANNUALS_BASIS:
        returnName = "01_Health_02 Maxim??ln?? ro??n?? vym????ovac?? z??klad na jednoho pracovn??ka (tzv.strop)"
        break
    case HEALTH_LIM_MONTHLY_STATE:
        returnName = "01_Health_03 Vym????ovac?? z??klad ze kter??ho plat?? pojistn?? st??t za st??tn?? poji??t??nce (mate??sk??, studenti, d??chodci)"
        break
    case HEALTH_LIM_MONTHLY_DIS50:
        returnName = "01_Health_04 Vym????ovac?? z??klad ze kter??ho plat?? pojistn?? st??t za st??tn?? poji??t??nce (mate??sk??, studenti, d??chodci) u zam??stnavatele zam??stn??vaj??c??ho v??ce ne?? 50% osob OZP"
        break
    case HEALTH_FACTOR_COMPOUND:
        returnName = "01_Health_05 slo??en?? sazba zdravotn??ho poji??t??n?? (zam??stnace + zam??stnavatele)"
        break
    case HEALTH_FACTOR_EMPLOYEE:
        returnName = "01_Health_06 pod??l sazby zdravotn??ho poji??t??n?? p??ipadaj??c??ho na zam??stnace (1/FACTOR_EMPLOYEE)"
        break
    case HEALTH_MARGIN_INCOME_EMP:
        returnName = "01_Health_07 hranice p????jmu pro vznik ????asti na poji??t??n?? pro zam??stnace v pracovn??m pom??ru"
        break
    case HEALTH_MARGIN_INCOME_AGR:
        returnName = "01_Health_08 hranice p????jmu pro vznik ????asti na poji??t??n?? pro zam??stnace na dohodu"
        break
    case SALARY_WORKING_SHIFT_WEEK:
        returnName = "02_Salary_01 Po??et pracovn??ch dn?? v t??dnu"
        break
    case SALARY_WORKING_SHIFT_TIME:
        returnName = "02_Salary_02 Po??et pracovn??ch hodin denn??"
        break
    case SALARY_MIN_MONTHLY_WAGE:
        returnName = "02_Salary_03 Minim??ln?? mzda m??s????n??"
        break
    case SALARY_MIN_HOURLY_WAGE:
        returnName = "02_Salary_04 Minim??ln?? mzda hodinov?? (100*K??)"
        break
    case SOCIAL_MAX_ANNUALS_BASIS:
        returnName = "03_Social_01 Maxim??ln?? ro??n?? vym????ovac?? z??klad na jednoho pracovn??ka (tzv.strop)"
        break
    case SOCIAL_FACTOR_EMPLOYER:
        returnName = "03_Social_02 Sazba - standardn?? soci??ln??ho poji??t??n?? - zam??stnavatele"
        break
    case SOCIAL_FACTOR_EMPLOYER_HIGHER:
        returnName = "03_Social_03 Sazba - vy???? soci??ln??ho poji??t??n?? - zam??stnavatele"
        break
    case SOCIAL_FACTOR_EMPLOYEE:
        returnName = "03_Social_04 Sazba soci??ln??ho poji??t??n?? - zam??stnance"
        break
    case SOCIAL_FACTOR_EMPLOYEE_GARANT:
        returnName = "03_Social_05 Sazba d??chodov??ho spo??en?? - zam??stnance - s d??chodov??m spo??en??m"
        break
    case SOCIAL_FACTOR_EMPLOYEE_REDUCE:
        returnName = "03_Social_06 Sn????en?? sazby soci??ln??ho poji??t??n?? - zam??stnance - s d??chodov??m spo??en??m"
        break
    case SOCIAL_MARGIN_INCOME_EMP:
        returnName = "03_Social_07 hranice p????jmu pro vznik ????asti na poji??t??n?? pro zam??stnace v pracovn??m pom??ru"
        break
    case SOCIAL_MARGIN_INCOME_AGR:
        returnName = "03_Social_08 hranice p????jmu pro vznik ????asti na poji??t??n?? pro zam??stnace na dohodu"
        break
    case TAXING_ALLOWANCE_PAYER:
        returnName = "04_Taxing_01 ????stka slevy na poplatn??ka"
        break
    case TAXING_ALLOWANCE_DISAB_1ST:
        returnName = "04_Taxing_02 ????stka slevy na invaliditu 1.stupn?? poplatn??ka"
        break
    case TAXING_ALLOWANCE_DISAB_2ND:
        returnName = "04_Taxing_03 ????stka slevy na invaliditu 2.stupn?? poplatn??ka"
        break
    case TAXING_ALLOWANCE_DISAB_3RD:
        returnName = "04_Taxing_04 ????stka slevy na invaliditu 3.stupn?? poplatn??ka"
        break
    case TAXING_ALLOWANCE_STUDY:
        returnName = "04_Taxing_05 ????stka slevy na poplatn??ka studenta"
        break
    case TAXING_ALLOWANCE_CHILD_1ST:
        returnName = "04_Taxing_06 ????stka slevy na d??t?? 1.po??ad??"
        break
    case TAXING_ALLOWANCE_CHILD_2ND:
        returnName = "04_Taxing_07 ????stka slevy na d??t?? 2.po??ad??"
        break
    case TAXING_ALLOWANCE_CHILD_3RD:
        returnName = "04_Taxing_08 ????stka slevy na d??t?? 3.po??ad??"
        break
    case TAXING_FACTOR_ADVANCES:
        returnName = "04_Taxing_09 Sazba dan?? na z??lohov?? p????jem"
        break
    case TAXING_FACTOR_WITHHOLD:
        returnName = "04_Taxing_10 Sazba dan?? na sr????kov?? p????jem"
        break
    case TAXING_FACTOR_SOLIDARY:
        returnName = "04_Taxing_11 Sazba dan?? na solid??rn?? zv????en??"
        break
    case TAXING_FACTOR_TAXRATE2:
        returnName = "04_Taxing_12 Sazba dan?? pro druh?? p??smo dan??"
        break
    case TAXING_MIN_AMOUNT_OF_TAXBONUS:
        returnName = "04_Taxing_13 Minim??ln?? ????stka pro da??ov?? bonus"
        break
    case TAXING_MAX_AMOUNT_OF_TAXBONUS:
        returnName = "04_Taxing_14 Maxim??ln?? ????stka pro da??ov?? bonus"
        break
    case TAXING_MARGIN_INCOME_OF_TAXBONUS:
        returnName = "04_Taxing_15 Minim??ln?? v????e p????jmu pro n??roku na da??ov?? bonus"
        break
    case TAXING_MARGIN_INCOME_OF_ROUNDING:
        returnName = "04_Taxing_16 Maxim??ln?? v????e p????jmu pro zaokrouhlov??n??"
        break
    case TAXING_MARGIN_INCOME_OF_WITHHOLD:
        returnName = "04_Taxing_17 Maxim??ln?? v????e p????jmu pro sr????kov?? p????jem"
        break
    case TAXING_MARGIN_INCOME_OF_SOLIDARY:
        returnName = "04_Taxing_18 Minim??ln?? v????e p????jmu pro solid??rn?? zv????en?? dan??"
        break
    case TAXING_MARGIN_INCOME_OF_TAXRATE2:
        returnName = "04_Taxing_18 Minim??ln?? v????e p????jmu pro druh?? p??smo dan??"
        break
    case TAXING_MARGIN_INCOME_OF_WHT_EMP:
        returnName = "04_Taxing_20 hranice p????jmu pro sr????kovou da?? pro zam??stnace v pracovn??m pom??ru (nepodepsal prohl????en??)"
        break
    case TAXING_MARGIN_INCOME_OF_WHT_AGR:
        returnName = "04_Taxing_21 hranice p????jmu pro sr????kovou da?? pro zam??stnace na dohodu (nepodepsal prohl????en??)"
        break
   default:
        returnName = "Nezn??m?? Term??n"
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

