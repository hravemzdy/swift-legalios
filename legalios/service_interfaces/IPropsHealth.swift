//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsHealth : IProps {
    var minMonthlyBasis: Int32 { get }
    var maxAnnualsBasis: Int32 { get }
    var limMonthlyState: Int32 { get }
    var limMonthlyDis50: Int32 { get }
    var factorCompound: Decimal { get }
    var factorEmployee: Decimal { get }
    var marginIncomeEmp: Int32 { get }
    var marginIncomeAgr: Int32 { get }

    func valueEquals(other: IPropsHealth?) -> Bool
    func hasParticy(term: WorkHealthTerms, incomeTerm: Int32, incomeSpec: Int32) -> Bool
    func roundedCompoundPaym(basisResult: Int32) -> Int32
    func roundedEmployeePaym(basisResult: Int32) -> Int32
    func roundedAugmentEmployeePaym(basisGenerals: Int32, basisAugment: Int32) -> Int32
    func roundedAugmentEmployerPaym(basisGenerals: Int32, baseEmployee: Int32, baseEmployer: Int32) -> Int32
    func roundedEmployerPaym(basisResult: Int32) -> Int32
    func annualsBasisCut(incomeList: Array<ParticyHealthTarget>, annuityBasis: Int32) -> (Int32, Int32, Array<ParticyHealthResult>)
}
