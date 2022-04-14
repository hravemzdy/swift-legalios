//
// Created by Ladislav Lisy on 28.02.2022.
//

import Foundation

class OperationsDec {
    static func multiply(_ op1: Decimal, mul: Decimal) -> Decimal {
        return op1 * mul
    }

    static func divide(_ op1: Decimal, div: Decimal) -> Decimal {
        if div.isZero {
            return Decimal.zero
        }
        return op1 / div
    }

    static func multiplyAndDivide(_ op1: Decimal, _ op2: Decimal, div: Decimal) -> Decimal {
        if div.isZero {
            return Decimal.zero
        }
        let multiRet = op1 * op2

        let dividRet = multiRet / div

        return dividRet
    }

    static func decimalCast(_ number: Int32) -> Decimal {
        return Decimal(integerLiteral: Int(number))
    }

    static func minIncMaxDecValue(_ valueToMinMax: Decimal, accValueToMax: Decimal, minLimitTo: Decimal, maxLimitTo: Decimal) -> Decimal {
        let minBase = minIncValue(valueToMinMax, minLimitTo: minLimitTo)

        let maxBase = maxDecAccumValue(minBase, accumToMax: accValueToMax, maxLimitTo: maxLimitTo)

        return maxBase
    }

    static func maxDecAccumValue(_ valueToMax: Decimal, accumToMax: Decimal, maxLimitTo: Decimal) -> Decimal {
        if maxLimitTo > Decimal.zero {
            let valueToReduce = max(valueToMax + accumToMax, maxLimitTo)

            return max(Decimal.zero, valueToReduce - accumToMax)
        }
        return valueToMax
    }

    static func maxDecAccumAbove(_ valueToMax: Decimal, accumToMax: Decimal, maxLimitTo: Decimal) -> Decimal {
        if maxLimitTo > Decimal.zero {
            let underToLimits = maxDecAccumValue(valueToMax, accumToMax: accumToMax, maxLimitTo: maxLimitTo)

            return max(Decimal.zero, valueToMax - underToLimits)
        }
        return Decimal.zero
    }

    static func minIncValue(_ valueToMin: Decimal, minLimitTo: Decimal) -> Decimal {
        if minLimitTo > Decimal.zero {
            if minLimitTo > valueToMin {
                return minLimitTo
            }
        }
        return valueToMin
    }

    static func maxDecValue(_ valueToMax: Decimal, maxLimitTo: Decimal) -> Decimal {
        if maxLimitTo > Decimal.zero {
            return min(valueToMax, maxLimitTo)
        }
        return valueToMax
    }

    static func suppressNegative(suppress: Bool, valueDec: Decimal) -> Decimal {
        if suppress && valueDec < Decimal.zero {
            return Decimal.zero
        }
        return valueDec
    }
}
