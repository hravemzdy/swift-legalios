//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsSocialBase : PropsBase, IPropsSocial {
    let maxAnnualsBasis: Int32
    let factorEmployer: Decimal
    let factorEmployerHigher: Decimal
    let factorEmployee: Decimal
    let factorEmployeeGarant: Decimal
    let factorEmployeeReduce: Decimal
    let marginIncomeEmp: Int32
    let marginIncomeAgr: Int32

    init(version: VersionId,
         maxAnnualsBasis: Int32,
         factorEmployer: Decimal,
         factorEmployerHigher: Decimal,
         factorEmployee: Decimal,
         factorEmployeeGarant: Decimal,
         factorEmployeeReduce: Decimal,
         marginIncomeEmp: Int32,
         marginIncomeAgr: Int32) {
        self.maxAnnualsBasis = maxAnnualsBasis
        self.factorEmployer = factorEmployer
        self.factorEmployerHigher = factorEmployerHigher
        self.factorEmployee = factorEmployee
        self.factorEmployeeGarant = factorEmployeeGarant
        self.factorEmployeeReduce = factorEmployeeReduce
        self.marginIncomeEmp = marginIncomeEmp
        self.marginIncomeAgr = marginIncomeAgr
        super.init(version: version)
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

    func valueEquals(other: IPropsSocial?) -> Bool {
        if (other == nil) {
            return false
        }
        return (self.maxAnnualsBasis == other?.maxAnnualsBasis &&
                self.factorEmployer == other?.factorEmployer &&
                self.factorEmployerHigher == other?.factorEmployerHigher &&
                self.factorEmployee == other?.factorEmployee &&
                self.factorEmployeeGarant == other?.factorEmployeeGarant &&
                self.factorEmployeeReduce == other?.factorEmployeeReduce &&
                self.marginIncomeEmp == other?.marginIncomeEmp &&
                self.marginIncomeAgr == other?.marginIncomeAgr)
    }

    func hasTermExemptionParticy(term: WorkSocialTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }
    func hasIncomeBasedEmploymentParticy(term: WorkSocialTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }
    func hasIncomeBasedAgreementsParticy(term: WorkSocialTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }
    func hasIncomeCumulatedParticy(term: WorkSocialTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }

    func hasParticy(term: WorkSocialTerms, incomeTerm: Int16, incomeSpec: Int16) -> Bool {
        var particySpec: Bool = true
        if (hasTermExemptionParticy(term: term)) {
            particySpec = false
        } else if (hasIncomeBasedAgreementsParticy(term: term) && marginIncomeAgr > 0) {
            particySpec = false
            if (hasIncomeCumulatedParticy(term: term)) {
                if (incomeTerm >= marginIncomeAgr) {
                    particySpec = true
                }
            } else {
                if (incomeSpec >= marginIncomeAgr) {
                    particySpec = true
                }
            }
        } else if (hasIncomeBasedEmploymentParticy(term: term) && marginIncomeEmp > 0) {
            particySpec = false
            if (hasIncomeCumulatedParticy(term: term)) {
                if (incomeTerm >= marginIncomeEmp) {
                    particySpec = true
                }
            } else {
                if (incomeSpec >= marginIncomeEmp) {
                    particySpec = true
                }
            }
        }
        return particySpec
    }

    private func decInsuranceRoundUp(valueDec: Decimal) -> Decimal {
        return OperationsRound.decRoundUp(valueDec)
    }

    private func intInsuranceRoundUp(valueDec: Decimal) -> Int32 {
        return OperationsRound.roundUp(valueDec)
    }

    func roundedEmployeePaym(basisResult: Int32) -> Int32 {
        let factorEmployee = OperationsDec.divide(factorEmployee, div: Decimal(integerLiteral: 100))
        return intInsuranceRoundUp(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(basisResult)), mul: factorEmployee))
    }

    func roundedEmployerPaym(basisResult: Int32) -> Int32 {
        let factorEmployer = OperationsDec.divide(factorEmployer, div: Decimal(integerLiteral: 100))
        return intInsuranceRoundUp(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(basisResult)), mul: factorEmployer))
    }

    func resultOvercaps(baseSuma: Int32, overCaps: Int32) -> (Int32, Int32) {
        let maxBaseEmployee = max(0, baseSuma - overCaps)
        let empBaseOvercaps = max(0, baseSuma - maxBaseEmployee)
        let valBaseOvercaps = max(0, overCaps - empBaseOvercaps)
        return (maxBaseEmployee, valBaseOvercaps)
    }

    func annualsBasisCut(incomeList: Array<ParticySocialTarget>, annuityBasis: Int32) -> (Int32, Int32, Array<ParticySocialResult>) {
        let annualyMaxim: Int32 = maxAnnualsBasis
        let annualsBasis = max(0, annualyMaxim - annuityBasis)
        let resultInit: (Int32, Int32, Array<ParticySocialResult>) = (annualyMaxim, annualsBasis, [])

        let resultList = incomeList.reduce(resultInit) { agr, x in
            var cutAnnualsBasis: Int32 = 0
            let rawAnnualsBasis: Int32 = x.targetsBase
            var remAnnualsBasis: Int32 = agr.1

            if (x.particyCode != 0) {
                cutAnnualsBasis = rawAnnualsBasis
                if (agr.0 > 0)
                {
                    let ovrAnnualsBasis = max(0, rawAnnualsBasis - agr.1)
                    cutAnnualsBasis = (rawAnnualsBasis - ovrAnnualsBasis)
                }
                remAnnualsBasis = max(0, (agr.1 - cutAnnualsBasis))
            }

            let r = ParticySocialResult(_contract: x.contractCode, _taxingTerm: x.subjectType, _interest: x.interestCode,
                    _socialTerm: x.subjectTerm, _particy: x.particyCode, _target: x.targetsBase, _result: max(0, cutAnnualsBasis))
            return (agr.0, remAnnualsBasis, agr.2.appendItem(r))
        }

        return resultList
    }
}
