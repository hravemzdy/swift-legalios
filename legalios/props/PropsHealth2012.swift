//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsHealth2012 : PropsHealthBase {
    override init(version: VersionId,
         minMonthlyBasis: Int32,
         maxAnnualsBasis: Int32,
         limMonthlyState: Int32,
         limMonthlyDis50: Int32,
         factorCompound: Decimal,
         factorEmployee: Decimal,
         marginIncomeEmp: Int32,
         marginIncomeAgr: Int32) {

        super.init(version: version,
            minMonthlyBasis: minMonthlyBasis,
            maxAnnualsBasis: maxAnnualsBasis,
            limMonthlyState: limMonthlyState,
            limMonthlyDis50: limMonthlyDis50,
            factorCompound: factorCompound,
            factorEmployee: factorEmployee,
            marginIncomeEmp: marginIncomeEmp,
            marginIncomeAgr: marginIncomeAgr)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                minMonthlyBasis: 0,
                maxAnnualsBasis: 0,
                limMonthlyState: 0,
                limMonthlyDis50: 0,
                factorCompound: Decimal.zero,
                factorEmployee: Decimal.zero,
                marginIncomeEmp: 0,
                marginIncomeAgr: 0)
    }

    static func empty() -> PropsHealth2012 {
        return PropsHealth2012(version: VERSION_ZERO)
    }

    override func hasTermExemptionParticy(term: WorkHealthTerms) -> Bool {
        return false
    }
    override func hasIncomeBasedEmploymentParticy(term: WorkHealthTerms) -> Bool {
        return (term == WorkHealthTerms.HealthTermAgreemWork)
    }
    override func hasIncomeBasedAgreementsParticy(term: WorkHealthTerms) -> Bool {
        return (term == WorkHealthTerms.HealthTermAgreemTask)
    }
    override func hasIncomeCumulatedParticy(term: WorkHealthTerms) -> Bool {
        var particy = false
        switch (term) {
        case WorkHealthTerms.HealthTermEmployments: particy = false
            break
        case WorkHealthTerms.HealthTermAgreemWork: particy = false
            break
        case WorkHealthTerms.HealthTermAgreemTask: particy = false
            break
        case WorkHealthTerms.HealthTermByContract: particy = false
            break
        }
        return particy
    }
}
