//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IPropsSalary : IProps {
    var workingShiftWeek : Int32 { get }
    var workingShiftTime : Int32 { get }
    var minMonthlyWage : Int32 { get }
    var minHourlyWage : Int32 { get }

    func valueEquals(other: IPropsSalary?) -> Bool
    func coeffWithPartAndFullHours(fullWorkHours: Decimal, partWorkHours: Decimal) -> Decimal
    func paymentWithMonthlyAndFullWeekAndFullAndWorkHours(amountMonthly: Decimal,
        fullWeekHours: Int32, partWeekHours: Int32,
        fullWorkHours: Int32, partWorkHours: Int32) -> Decimal
    func paymentRoundUpWithMonthlyAndFullWeekAndFullAndWorkHours(amountMonthly: Decimal,
        fullWeekHours: Int32, partWeekHours: Int32,
        fullWorkHours: Int32, partWorkHours: Int32) -> Decimal
    func paymentWithMonthlyAndCoeffAndFullAndWorkHours(amountMonthly: Decimal,
        monthlyCoeff: Decimal, fullWorkHours: Int32, partWorkHours: Int32) -> Decimal
    func paymentRoundUpWithMonthlyAndCoeffAndFullAndWorkHours(amountMonthly: Decimal,
        monthlyCoeff: Decimal, fullWorkHours: Int32, partWorkHours: Int32) -> Decimal
    func paymentWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal,
        monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func paymentRoundUpWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal,
        monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func relativeAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func relativeTariffWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func relativePaymentWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func reverzedAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func reverzedTariffWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func reverzedPaymentWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal
    func paymentWithTariffAndHours(tariffHourly: Decimal, workingsHours: Decimal) -> Decimal
    func paymentRoundUpWithTariffAndHours(tariffHourly: Decimal, workingsHours: Decimal) -> Decimal
    func tariffWithPaymentAndHours(amountHourly: Decimal, workingsHours: Decimal) -> Decimal
    func paymentWithAmountFixed(amountFixed: Decimal) -> Decimal
    func paymentRoundUpWithAmountFixed(amountFixed: Decimal) -> Decimal
    func hoursToHalfHoursUp(hoursValue: Decimal) -> Decimal
    func hoursToQuartHoursUp(hoursValue: Decimal) -> Decimal
    func hoursToHalfHoursDown(hoursValue: Decimal) -> Decimal
    func hoursToQuartHoursDown(hoursValue: Decimal) -> Decimal
    func hoursToHalfHoursNorm(hoursValue: Decimal) -> Decimal
    func hoursToQuartHoursNorm(hoursValue: Decimal) -> Decimal
    func moneyToRoundDown(moneyValue: Decimal) -> Decimal
    func moneyToRoundUp(moneyValue: Decimal) -> Decimal
    func moneyToRoundNorm(moneyValue: Decimal) -> Decimal
}