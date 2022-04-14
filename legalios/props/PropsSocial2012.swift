//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsSocial2012 : PropsSocialBase {
    override init(version: VersionId,
         maxAnnualsBasis: Int32,
         factorEmployer: Decimal,
         factorEmployerHigher: Decimal,
         factorEmployee: Decimal,
         factorEmployeeGarant: Decimal,
         factorEmployeeReduce: Decimal,
         marginIncomeEmp: Int32,
         marginIncomeAgr: Int32) {

        super.init(version: version,
            maxAnnualsBasis: maxAnnualsBasis,
            factorEmployer: factorEmployer,
            factorEmployerHigher: factorEmployerHigher,
            factorEmployee: factorEmployee,
            factorEmployeeGarant: factorEmployeeGarant,
            factorEmployeeReduce: factorEmployeeReduce,
            marginIncomeEmp: marginIncomeEmp,
            marginIncomeAgr: marginIncomeAgr)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                maxAnnualsBasis: 0,
                factorEmployer: Decimal.zero,
                factorEmployerHigher: Decimal.zero,
                factorEmployee: Decimal.zero,
                factorEmployeeGarant: Decimal.zero,
                factorEmployeeReduce: Decimal.zero,
                marginIncomeEmp: 0,
                marginIncomeAgr: 0)
    }

    static func empty() -> PropsSocial2012 {
        return PropsSocial2012(version: VERSION_ZERO)
    }

    override func hasTermExemptionParticy(term: WorkSocialTerms) -> Bool {
        return false
    }
    override func hasIncomeBasedEmploymentParticy(term: WorkSocialTerms) -> Bool {
        return (term == WorkSocialTerms.SocialTermSmallsEmpl)
    }
    override func hasIncomeBasedAgreementsParticy(term: WorkSocialTerms) -> Bool {
        return (term == WorkSocialTerms.SocialTermAgreemTask)
    }
    override func hasIncomeCumulatedParticy(term: WorkSocialTerms) -> Bool {
        var particy = false
        switch (term) {
        case WorkSocialTerms.SocialTermEmployments: particy = false
            break
        case WorkSocialTerms.SocialTermAgreemTask: particy = true
            break
        case WorkSocialTerms.SocialTermSmallsEmpl: particy = false
            break
        case WorkSocialTerms.SocialTermShortsMeet: particy = false
            break
        case WorkSocialTerms.SocialTermShortsDeny: particy = false
            break
        case WorkSocialTerms.SocialTermByContract: particy = false
            break
        }
        return particy
    }
}
