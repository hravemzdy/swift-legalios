//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsSocial : IProps {
    var maxAnnualsBasis: Int32 { get }
    var factorEmployer: Decimal { get }
    var factorEmployerHigher: Decimal { get }
    var factorEmployee: Decimal { get }
    var factorEmployeeGarant: Decimal { get }
    var factorEmployeeReduce: Decimal { get }
    var marginIncomeEmp: Int32 { get }
    var marginIncomeAgr: Int32 { get }

    func valueEquals(other: IPropsSocial?) -> Bool
    func hasParticy(term: WorkSocialTerms, incomeTerm: Int16, incomeSpec: Int16) -> Bool
    func roundedEmployeePaym(basisResult: Int32) -> Int32
    func roundedEmployerPaym(basisResult: Int32) -> Int32
    func resultOvercaps(baseSuma: Int32, overCaps: Int32) -> (Int32, Int32)
    func annualsBasisCut(incomeList: Array<ParticySocialTarget>, annuityBasis: Int32) -> (Int32, Int32, Array<ParticySocialResult>)
}
