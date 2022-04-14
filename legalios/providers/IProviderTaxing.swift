//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

protocol IProviderTaxing: IPropsProvider {
    func allowancePayer(_ period: IPeriod) -> Int32
    func allowanceDisab1st(_ period: IPeriod) -> Int32
    func allowanceDisab2nd(_ period: IPeriod) -> Int32
    func allowanceDisab3rd(_ period: IPeriod) -> Int32
    func allowanceStudy(_ period: IPeriod) -> Int32
    func allowanceChild1st(_ period: IPeriod) -> Int32
    func allowanceChild2nd(_ period: IPeriod) -> Int32
    func allowanceChild3rd(_ period: IPeriod) -> Int32
    func factorAdvances(_ period: IPeriod) -> Decimal
    func factorWithhold(_ period: IPeriod) -> Decimal
    func factorSolidary(_ period: IPeriod) -> Decimal
    func minAmountOfTaxBonus(_ period: IPeriod) -> Int32
    func maxAmountOfTaxBonus(_ period: IPeriod) -> Int32
    func marginIncomeOfTaxBonus(_ period: IPeriod) -> Int32
    func marginIncomeOfRounding(_ period: IPeriod) -> Int32
    func marginIncomeOfWithhold(_ period: IPeriod) -> Int32
    func marginIncomeOfSolidary(_ period: IPeriod) -> Int32
    func marginIncomeOfWthEmp(_ period: IPeriod) -> Int32
    func marginIncomeOfWthAgr(_ period: IPeriod) -> Int32
}
