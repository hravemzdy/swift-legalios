//
// Created by Ladislav Lisy on 01.03.2022.
//

import Foundation

extension Array {
    /// Returns a new `Array` made by appending a given element to the `Array`.
    func appendItem(_ newElement: Element) -> Array {
        var a = Array(self)
        a.append(newElement)
        return a
    }
}
public class ParticyHealthTarget {
    let contractCode: Int16
    let subjectType: WorkTaxingTerms
    let interestCode: Int16
    let subjectTerm: WorkHealthTerms
    let particyCode: Int16
    var targetsBase: Int32

    init(_contract: Int16, _taxingTerm: WorkTaxingTerms, _interest: Int16,
         _healthTerm: WorkHealthTerms, _particy: Int16, _basis: Int32) {
        contractCode = _contract
        subjectType = _taxingTerm
        interestCode = _interest
        subjectTerm = _healthTerm
        particyCode = _particy
        targetsBase = _basis
    }

    func addTargetBase(targetsBase: Int32) -> Int32 {
        self.targetsBase += targetsBase

        return self.targetsBase
    }

    func incomeScore() -> Int32 {
        var resultType : Int32 = 0
        switch (subjectType) {
        case WorkTaxingTerms.TaxingTermEmployments:
            resultType = 900
            break
        case WorkTaxingTerms.TaxingTermAgreemTask:
            resultType = 100
            break
        case WorkTaxingTerms.TaxingTermStatutPart:
            resultType = 500
            break
        case WorkTaxingTerms.TaxingTermByContract:
            resultType = 0
            break
        }
        var resultBase : Int32 = 0
        switch (subjectTerm) {
        case WorkHealthTerms.HealthTermEmployments:
            resultBase = 9000
            break
        case WorkHealthTerms.HealthTermAgreemWork:
            resultBase = 5000
            break
        case WorkHealthTerms.HealthTermAgreemTask:
            resultBase = 4000
            break
        case WorkHealthTerms.HealthTermByContract:
            resultBase = 0
            break
        }
        var interestRes : Int32 = 0
        if (interestCode == 1) {
            interestRes = 10000
        }
        var particyRes : Int32 = 0
        if (particyCode == 1) {
            particyRes = 100000
        }
        return (resultType + resultBase + interestRes + particyRes)
    }

    func resultComparator() -> (ParticyHealthTarget, ParticyHealthTarget) -> Int {
        return { (x: ParticyHealthTarget, y: ParticyHealthTarget) in
            let xIncomeScore = x.incomeScore()
            let yIncomeScore = y.incomeScore()

            if (xIncomeScore == yIncomeScore) {
                if (x.contractCode == y.contractCode) {
                    return 0
                }
                if (x.contractCode < y.contractCode) {
                    return -1
                }
                return 1
            }
            if (yIncomeScore == xIncomeScore) {
                return 0
            }
            if (yIncomeScore < xIncomeScore) {
                return -1
            }
            return 1
        }
    }
}

public class ParticyHealthResult {
    let contractCode: Int16
    let subjectType: WorkTaxingTerms
    let interestCode: Int16
    let subjectTerm: WorkHealthTerms
    let particyCode: Int16
    var targetsBase: Int32
    let resultsBase: Int32

    init(_contract: Int16, _taxingTerm: WorkTaxingTerms, _interest: Int16, _healthTerm: WorkHealthTerms,
         _particy: Int16, _target: Int32, _result: Int32) {
        contractCode = _contract
        subjectType = _taxingTerm
        interestCode = _interest
        subjectTerm = _healthTerm
        particyCode = _particy
        targetsBase = _target
        resultsBase = _result
    }
}

public class ParticySocialTarget {
    let contractCode: Int16
    let subjectType: WorkTaxingTerms
    let interestCode: Int16
    let subjectTerm: WorkSocialTerms
    let particyCode: Int16
    var targetsBase: Int32

    init(_contract: Int16, _taxingTerm: WorkTaxingTerms, _interest: Int16,
         _healthTerm: WorkSocialTerms, _particy: Int16, _basis: Int32) {
        contractCode = _contract
        subjectType = _taxingTerm
        interestCode = _interest
        subjectTerm = _healthTerm
        particyCode = _particy
        targetsBase = _basis
    }

    func addTargetBase(targetsBase: Int32) -> Int32 {
        self.targetsBase += targetsBase

        return self.targetsBase
    }

    func incomeScore() -> Int32 {
        var resultType : Int32 = 0
        switch (subjectType) {
        case WorkTaxingTerms.TaxingTermEmployments:
            resultType = 900
            break
        case WorkTaxingTerms.TaxingTermAgreemTask:
            resultType = 100
            break
        case WorkTaxingTerms.TaxingTermStatutPart:
            resultType = 500
            break
        case WorkTaxingTerms.TaxingTermByContract:
            resultType = 0
            break
        }
        var resultBase : Int32 = 0
        switch (subjectTerm) {
        case WorkSocialTerms.SocialTermEmployments:
            resultBase = 9000
            break
        case WorkSocialTerms.SocialTermSmallsEmpl:
            resultBase = 5000
            break
        case WorkSocialTerms.SocialTermShortsMeet:
            resultBase = 4000
            break
        case WorkSocialTerms.SocialTermShortsDeny:
            resultBase = 0
            break
        case WorkSocialTerms.SocialTermAgreemTask:
            resultBase = 0
            break
        case WorkSocialTerms.SocialTermByContract:
            resultBase = 0
            break
        }
        var interestRes : Int32 = 0
        if (interestCode == 1) {
            interestRes = 10000
        }
        var particyRes : Int32 = 0
        if (particyCode == 1) {
            particyRes = 100000
        }
        return (resultType + resultBase + interestRes + particyRes)
    }
    func resultComparator() -> (ParticySocialTarget, ParticySocialTarget) -> Int {
        return { (x: ParticySocialTarget, y: ParticySocialTarget) in
            let xIncomeScore = x.incomeScore()
            let yIncomeScore = y.incomeScore()

            if (xIncomeScore == yIncomeScore) {
                if (x.contractCode == y.contractCode) {
                    return 0
                }
                if (x.contractCode < y.contractCode) {
                    return -1
                }
                return 1
            }
            if (yIncomeScore == xIncomeScore) {
                return 0
            }
            if (yIncomeScore < xIncomeScore) {
                return -1
            }
            return 1
        }
    }
}

public class ParticySocialResult {
    let contractCode: Int16
    let subjectType: WorkTaxingTerms
    let interestCode: Int16
    let subjectTerm: WorkSocialTerms
    let particyCode: Int16
    var targetsBase: Int32
    let resultsBase: Int32

    init(_contract: Int16, _taxingTerm: WorkTaxingTerms, _interest: Int16,
         _socialTerm: WorkSocialTerms, _particy: Int16, _target: Int32, _result: Int32) {
        contractCode = _contract
        subjectType = _taxingTerm
        interestCode = _interest
        subjectTerm = _socialTerm
        particyCode = _particy
        targetsBase = _target
        resultsBase = _result
    }
}

