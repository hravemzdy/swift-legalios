//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsHealthBase : PropsBase, IPropsHealth {
    let minMonthlyBasis: Int32
    let maxAnnualsBasis: Int32
    let limMonthlyState: Int32
    let limMonthlyDis50: Int32
    let factorCompound: Decimal
    let factorEmployee: Decimal
    let marginIncomeEmp: Int32
    let marginIncomeAgr: Int32

    init(version: VersionId,
         minMonthlyBasis: Int32,
         maxAnnualsBasis: Int32,
         limMonthlyState: Int32,
         limMonthlyDis50: Int32,
         factorCompound: Decimal,
         factorEmployee: Decimal,
         marginIncomeEmp: Int32,
         marginIncomeAgr: Int32) {
        self.minMonthlyBasis = minMonthlyBasis
        self.maxAnnualsBasis = maxAnnualsBasis
        self.limMonthlyState = limMonthlyState
        self.limMonthlyDis50 = limMonthlyDis50
        self.factorCompound = factorCompound
        self.factorEmployee = factorEmployee
        self.marginIncomeEmp = marginIncomeEmp
        self.marginIncomeAgr = marginIncomeAgr
        super.init(version: version)
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

    func valueEquals(other: IPropsHealth?) -> Bool {
        if (other == nil)
        {
            return false
        }
        return (self.minMonthlyBasis == other?.minMonthlyBasis &&
                self.maxAnnualsBasis == other?.maxAnnualsBasis &&
                self.limMonthlyState == other?.limMonthlyState &&
                self.limMonthlyDis50 == other?.limMonthlyDis50 &&
                self.factorCompound == other?.factorCompound &&
                self.factorEmployee == other?.factorEmployee &&
                self.marginIncomeEmp == other?.marginIncomeEmp &&
                self.marginIncomeAgr == other?.marginIncomeAgr)
    }

    func hasTermExemptionParticy(term: WorkHealthTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }
    func hasIncomeBasedEmploymentParticy(term: WorkHealthTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }
    func hasIncomeBasedAgreementsParticy(term: WorkHealthTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }
    func hasIncomeCumulatedParticy(term: WorkHealthTerms) -> Bool {
        preconditionFailure("This method must be overridden")
    }

    func hasParticy(term: WorkHealthTerms, incomeTerm: Int32, incomeSpec: Int32) -> Bool {
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

    func roundedCompoundPaym(basisResult: Int32) -> Int32 {
        let factorCompound = OperationsDec.divide(factorCompound, div: Decimal(integerLiteral: 100))

        return intInsuranceRoundUp(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(basisResult)), mul: factorCompound))
    }

    func roundedEmployeePaym(basisResult: Int32) -> Int32 {
        let factorCompound = OperationsDec.divide(factorCompound, div: Decimal(integerLiteral: 100))
        return intInsuranceRoundUp(valueDec: OperationsDec.multiplyAndDivide(Decimal(integerLiteral: Int(basisResult)), factorCompound, div: factorEmployee))
    }

    func roundedAugmentEmployeePaym(basisGenerals: Int32, basisAugment: Int32) -> Int32 {
        let factorCompound = OperationsDec.divide(factorCompound, div: Decimal(integerLiteral: 100))

        return intInsuranceRoundUp(
                valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(basisAugment)), mul: factorCompound)
                        + OperationsDec.multiplyAndDivide(Decimal(integerLiteral: Int(basisGenerals)), factorCompound, div: factorEmployee)
        )
    }

    func roundedAugmentEmployerPaym(basisGenerals: Int32, baseEmployee: Int32, baseEmployer: Int32) -> Int32 {
        let factorCompound = OperationsDec.divide(factorCompound, div: Decimal(integerLiteral: 100))

        let compoundBasis = baseEmployer + baseEmployee + basisGenerals

        let compoundPayment = intInsuranceRoundUp(valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(compoundBasis)), mul: factorCompound))
        let employeePayment = intInsuranceRoundUp(
                valueDec: OperationsDec.multiply(Decimal(integerLiteral: Int(baseEmployee)), mul: factorCompound)
                        + OperationsDec.multiplyAndDivide(Decimal(integerLiteral: Int(basisGenerals)), factorCompound, div: factorEmployee)
        )

        return max(0, compoundPayment - employeePayment)
    }

    func roundedEmployerPaym(basisResult: Int32) -> Int32 {
        let compoundPayment = roundedCompoundPaym(basisResult: basisResult)
        let employeePayment = roundedEmployeePaym(basisResult: basisResult)

        return max(0, compoundPayment - employeePayment)
    }

    func annualsBasisCut(incomeList: Array<ParticyHealthTarget>, annuityBasis: Int32) -> (Int32, Int32, Array<ParticyHealthResult>) {
        let annualyMaxim: Int32 = maxAnnualsBasis
        let annualsBasis = max(0, annualyMaxim - annuityBasis)
        let resultInit: (Int32, Int32, Array<ParticyHealthResult>) = (annualyMaxim, annualsBasis, [])

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

            let r = ParticyHealthResult(_contract: x.contractCode, _taxingTerm: x.subjectType, _interest: x.interestCode,
                    _healthTerm: x.subjectTerm, _particy: x.particyCode, _target: x.targetsBase, _result: max(0, cutAnnualsBasis))
            return (agr.0, remAnnualsBasis, agr.2.appendItem(r))
        }

        return resultList
    }
}
