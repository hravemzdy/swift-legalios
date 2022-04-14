//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class ProviderTaxing: ProviderBase, IProviderTaxing {
    typealias P = PropsTaxingBase

    init(versionId: Int16) {
        super.init(versionId: VersionId.get(value: versionId))
    }

    func getProps<P>(_ period: IPeriod) -> P { return PropsTaxing.empty() as! P }

    func allowancePayer(_ period: IPeriod) -> Int32 {return 0}

    func allowanceDisab1st(_ period: IPeriod) -> Int32 {return 0}

    func allowanceDisab2nd(_ period: IPeriod) -> Int32 {return 0}

    func allowanceDisab3rd(_ period: IPeriod) -> Int32 {return 0}

    func allowanceStudy(_ period: IPeriod) -> Int32 {return 0}

    func allowanceChild1st(_ period: IPeriod) -> Int32  {return 0}

    func allowanceChild2nd(_ period: IPeriod) -> Int32  {return 0}

    func allowanceChild3rd(_ period: IPeriod) -> Int32  {return 0}

    func factorAdvances(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorWithhold(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorSolidary(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func factorTaxRate2(_ period: IPeriod) -> Decimal {return Decimal.zero}

    func minAmountOfTaxBonus(_ period: IPeriod) -> Int32  {return 0}

    func maxAmountOfTaxBonus(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeOfTaxBonus(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeOfRounding(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeOfWithhold(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeOfSolidary(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeOfTaxRate2(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeOfWthEmp(_ period: IPeriod) -> Int32  {return 0}

    func marginIncomeOfWthAgr(_ period: IPeriod) -> Int32  {return 0}
}

