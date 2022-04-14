//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class PropsSalary : PropsBase, IPropsSalary {
    let workingShiftWeek : Int32
    let workingShiftTime : Int32
    let minMonthlyWage : Int32
    let minHourlyWage : Int32

    init(version: VersionId,
         workingShiftWeek : Int32,
         workingShiftTime : Int32,
         minMonthlyWage : Int32,
         minHourlyWage : Int32) {
        self.workingShiftWeek = workingShiftWeek
        self.workingShiftTime = workingShiftTime
        self.minMonthlyWage = minMonthlyWage
        self.minHourlyWage = minHourlyWage
        super.init(version: version)
    }

    convenience init(version: Int16) {
        self.init(version: VersionId.get(value: version),
                workingShiftWeek: 0,
                workingShiftTime: 0,
                minMonthlyWage: 0,
                minHourlyWage: 0)
    }

    static func empty() -> PropsSalary {
        return PropsSalary(version: VERSION_ZERO)
    }

    static func factorizeValue(baseValue: Decimal, factor: Decimal) -> Decimal {
        let result = OperationsDec.multiply(baseValue, mul: factor)

        return result
    }
    static func reverzedFactorizeValue(baseValue: Decimal, factor: Decimal) -> Decimal {
        let result = OperationsDec.multiply(baseValue, mul: OperationsDec.divide(Decimal(integerLiteral: 1), div: factor))

        return result
    }

    func valueEquals(other: IPropsSalary?) -> Bool {
        if (other == nil)
        {
            return false
        }
        return (self.workingShiftWeek == other?.workingShiftWeek &&
                self.workingShiftTime == other?.workingShiftTime &&
                self.minMonthlyWage == other?.minMonthlyWage &&
                self.minHourlyWage == other?.minHourlyWage)
    }

    private func totalHoursWithFullAndPartHours(fullWorkHours: Int32, partWorkHours: Int32) -> Int32 {
        let totalsHours = max(0, partWorkHours)

        let resultHours = min(fullWorkHours, totalsHours)

        return resultHours
    }
    private func decPaymentWithMonthlyAndCoeffAndFullAndWorkHours(amountMonthly: Decimal, monthlyCoeff: Decimal, fullWorkHours: Int32, partWorkHours: Int32) -> Decimal {
        let coeffAmount = PropsSalary.factorizeValue(baseValue: amountMonthly, factor: monthlyCoeff)

        let payment = decPaymentWithMonthlyAndFullAndWorkHours(amountMonthly: coeffAmount, fullWorkHours: fullWorkHours, partWorkHours: partWorkHours)

        return payment
    }
    private func decPaymentWithMonthlyAndFullAndWorkHours(amountMonthly: Decimal, fullWorkHours: Int32, partWorkHours: Int32) -> Decimal {
        let paymWorkHours = totalHoursWithFullAndPartHours(fullWorkHours: fullWorkHours, partWorkHours: partWorkHours)

        let payment = OperationsDec.multiplyAndDivide(amountMonthly, Decimal(integerLiteral: Int(paymWorkHours)), div: Decimal(integerLiteral: Int(fullWorkHours)))

        return payment
    }
    private func decPaymentWithTariffAndHours(tariffHourly: Decimal, workingsHours: Decimal) -> Decimal {
        let totalHours = max(Decimal.zero, workingsHours)

        let payment = OperationsDec.multiply(totalHours, mul: tariffHourly)

        return payment
    }
    private func decTariffWithPaymentAndHours(amountHourly: Decimal, workingsHours: Decimal) -> Decimal {
        let totalHours = max(Decimal.zero, workingsHours)

        let tariff = OperationsDec.divide(amountHourly, div: totalHours)

        return tariff
    }
    private func decPaymentWithAmountFixed(amountFixed: Decimal) -> Decimal {
        let payment = amountFixed

        return payment
    }

    func coeffWithPartAndFullHours(fullWorkHours: Decimal, partWorkHours: Decimal) -> Decimal {
        let coeffWorking = min(Decimal(integerLiteral: 1), OperationsDec.divide(partWorkHours, div: fullWorkHours))

        return coeffWorking
    }

    func paymentWithMonthlyAndFullWeekAndFullAndWorkHours(amountMonthly: Decimal,
                                                          fullWeekHours: Int32, partWeekHours: Int32,
                                                          fullWorkHours: Int32, partWorkHours: Int32) -> Decimal {
        let coeffSalary = coeffWithPartAndFullHours(fullWorkHours: Decimal(integerLiteral: Int(partWeekHours)), partWorkHours: Decimal(integerLiteral: Int(fullWeekHours)))

        let salaryValue = paymentWithMonthlyAndCoeffAndFullAndWorkHours(amountMonthly: amountMonthly, monthlyCoeff: coeffSalary, fullWorkHours: fullWorkHours, partWorkHours: partWorkHours)

        return salaryValue
    }

    func paymentRoundUpWithMonthlyAndFullWeekAndFullAndWorkHours(amountMonthly: Decimal,
                                                                 fullWeekHours: Int32, partWeekHours: Int32,
                                                                 fullWorkHours: Int32, partWorkHours: Int32) -> Decimal {
        let coeffSalary = coeffWithPartAndFullHours(fullWorkHours: Decimal(integerLiteral: Int(partWeekHours)), partWorkHours: Decimal(integerLiteral: Int(fullWeekHours)))

        let salaryValue = paymentRoundUpWithMonthlyAndCoeffAndFullAndWorkHours(amountMonthly: amountMonthly, monthlyCoeff: coeffSalary, fullWorkHours: fullWorkHours, partWorkHours: partWorkHours)

        return salaryValue
    }

    func paymentWithMonthlyAndCoeffAndFullAndWorkHours(amountMonthly: Decimal, monthlyCoeff: Decimal, fullWorkHours: Int32, partWorkHours: Int32) -> Decimal {
        let amountCoeffs = PropsSalary.factorizeValue(baseValue: amountMonthly, factor: monthlyCoeff)

        let paymentValue = decPaymentWithMonthlyAndFullAndWorkHours(amountMonthly: amountCoeffs, fullWorkHours: fullWorkHours, partWorkHours: partWorkHours)

        return OperationsRound.decRoundNorm(paymentValue)
    }

    func paymentRoundUpWithMonthlyAndCoeffAndFullAndWorkHours(amountMonthly: Decimal, monthlyCoeff: Decimal, fullWorkHours: Int32, partWorkHours: Int32) -> Decimal {
        let amountCoeffs = PropsSalary.factorizeValue(baseValue: amountMonthly, factor: monthlyCoeff)

        let paymentValue = decPaymentWithMonthlyAndFullAndWorkHours(amountMonthly: amountCoeffs, fullWorkHours: fullWorkHours, partWorkHours: partWorkHours)

        return OperationsRound.decRoundUp(paymentValue)
    }

    func paymentWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let amountFactor = PropsSalary.factorizeValue(baseValue: amountMonthly, factor: monthlyCoeff)

        let paymentValue = PropsSalary.factorizeValue(baseValue: amountFactor, factor: workingCoeff)

        return OperationsRound.decRoundNorm(paymentValue)
    }

    func paymentRoundUpWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let amountFactor = PropsSalary.factorizeValue(baseValue: amountMonthly, factor: monthlyCoeff)

        let paymentValue = PropsSalary.factorizeValue(baseValue: amountFactor, factor: workingCoeff)

        return OperationsRound.decRoundUp(paymentValue)
    }

    func relativeAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let amountCoeffs = PropsSalary.factorizeValue(baseValue: amountMonthly, factor: monthlyCoeff)

        let relativeAmount = PropsSalary.factorizeValue(baseValue: amountCoeffs, factor: workingCoeff)

        return relativeAmount
    }

    func relativeTariffWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let paymentValue = relativeAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: amountMonthly, monthlyCoeff: monthlyCoeff, workingCoeff: workingCoeff)

        return OperationsRound.decRoundNorm01(paymentValue)
    }

    func relativePaymentWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let paymentValue = relativeAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: amountMonthly, monthlyCoeff: monthlyCoeff, workingCoeff: workingCoeff)

        return OperationsRound.decRoundNorm(paymentValue)
    }

    func reverzedAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let amountCoeffs = PropsSalary.reverzedFactorizeValue(baseValue: amountMonthly, factor: monthlyCoeff)

        let reverzedAmount = PropsSalary.reverzedFactorizeValue(baseValue: amountCoeffs, factor: workingCoeff)

        return reverzedAmount
    }

    func reverzedTariffWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let paymentValue = reverzedAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: amountMonthly, monthlyCoeff: monthlyCoeff, workingCoeff: workingCoeff)

        return OperationsRound.decRoundNorm01(paymentValue)
    }

    func reverzedPaymentWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: Decimal, monthlyCoeff: Decimal, workingCoeff: Decimal) -> Decimal {
        let paymentValue = reverzedAmountWithMonthlyAndCoeffAndWorkCoeff(amountMonthly: amountMonthly, monthlyCoeff: monthlyCoeff, workingCoeff: workingCoeff)

        return OperationsRound.decRoundNorm(paymentValue)
    }

    func paymentWithTariffAndHours(tariffHourly: Decimal, workingsHours: Decimal) -> Decimal {
        let paymentValue = decPaymentWithTariffAndHours(tariffHourly: tariffHourly, workingsHours: workingsHours)

        return OperationsRound.decRoundNorm(paymentValue)
    }

    func paymentRoundUpWithTariffAndHours(tariffHourly: Decimal, workingsHours: Decimal) -> Decimal {
        let paymentValue = decPaymentWithTariffAndHours(tariffHourly: tariffHourly, workingsHours: workingsHours)

        return OperationsRound.decRoundUp(paymentValue)
    }

    func tariffWithPaymentAndHours(amountHourly: Decimal, workingsHours: Decimal) -> Decimal {
        let tariffValue = decTariffWithPaymentAndHours(amountHourly: amountHourly, workingsHours: workingsHours)

        return moneyToRoundNorm(moneyValue: tariffValue)
    }

    func paymentWithAmountFixed(amountFixed: Decimal) -> Decimal {
        let paymentValue = decPaymentWithAmountFixed(amountFixed: amountFixed)

        return OperationsRound.decRoundNorm(paymentValue)
    }

    func paymentRoundUpWithAmountFixed(amountFixed: Decimal) -> Decimal {
        let paymentValue = decPaymentWithAmountFixed(amountFixed: amountFixed)

        return OperationsRound.decRoundUp(paymentValue)
    }

    func hoursToHalfHoursUp(hoursValue: Decimal) -> Decimal {
        return OperationsRound.decRoundUp50(hoursValue)
    }

    func hoursToQuartHoursUp(hoursValue: Decimal) -> Decimal {
        return OperationsRound.decRoundUp25(hoursValue)
    }

    func hoursToHalfHoursDown(hoursValue: Decimal) -> Decimal {
        return OperationsRound.decRoundDown50(hoursValue)
    }

    func hoursToQuartHoursDown(hoursValue: Decimal) -> Decimal {
        return OperationsRound.decRoundDown25(hoursValue)
    }

    func hoursToHalfHoursNorm(hoursValue: Decimal) -> Decimal {
        return OperationsRound.decRoundNorm50(hoursValue)
    }

    func hoursToQuartHoursNorm(hoursValue: Decimal) -> Decimal {
        return OperationsRound.decRoundNorm25(hoursValue)
    }

    func moneyToRoundDown(moneyValue: Decimal) -> Decimal {
        return OperationsRound.decRoundDown01(moneyValue)
    }

    func moneyToRoundUp(moneyValue: Decimal) -> Decimal {
        return OperationsRound.decRoundUp01(moneyValue)
    }

    func moneyToRoundNorm(moneyValue: Decimal) -> Decimal {
        return OperationsRound.decRoundNorm01(moneyValue)
    }

}
