//
// Created by Ladislav Lisy on 28.02.2022.
//

import Foundation

class OperationsRound {
    static let INT_ROUNDING_CONST = Decimal(floatLiteral: 0.5)

    static func roundToInt(_ valueDec: Decimal) -> Int32 {
        var roundInp = (abs(valueDec) + INT_ROUNDING_CONST)
        var roundRet = Decimal()
        NSDecimalRound(&roundRet, &roundInp, 0, NSDecimalNumber.RoundingMode.down)

        if valueDec < Decimal.zero {
            roundRet.negate()
            return Int32(NSDecimalNumber(decimal: roundRet).intValue)
        }
        return Int32(NSDecimalNumber(decimal: roundRet).intValue)
    }
    static func roundUp(_ valueDec: Decimal) -> Int32 {
        var roundInp = abs(valueDec)
        var roundRet = Decimal()
        NSDecimalRound(&roundRet, &roundInp, 0, NSDecimalNumber.RoundingMode.up)

        if valueDec < Decimal.zero {
            roundRet.negate()
            return Int32(NSDecimalNumber(decimal: roundRet).intValue)
        }
        return Int32(NSDecimalNumber(decimal: roundRet).intValue)
    }

    static func roundDown(_ valueDec: Decimal) -> Int32 {
        var roundInp = abs(valueDec)
        var roundRet = Decimal()
        NSDecimalRound(&roundRet, &roundInp, 0, NSDecimalNumber.RoundingMode.down)

        if valueDec < Decimal.zero {
            roundRet.negate()
            return Int32(NSDecimalNumber(decimal: roundRet).intValue)
        }
        return Int32(NSDecimalNumber(decimal: roundRet).intValue)
    }
    static func roundNorm(_ valueDec: Decimal) -> Int32 {
        var roundInp = abs(valueDec) + INT_ROUNDING_CONST
        var roundRet = Decimal()
        NSDecimalRound(&roundRet, &roundInp, 0, NSDecimalNumber.RoundingMode.down)

        if valueDec < Decimal.zero {
            roundRet.negate()
            return Int32(NSDecimalNumber(decimal: roundRet).intValue)
        }
        return Int32(NSDecimalNumber(decimal: roundRet).intValue)
    }

    static func nearRoundUp(_ valueDec: Decimal, nearest: Int32) -> Int32 {
        let nearestBig = Decimal(integerLiteral: Int(nearest))

        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundUp(dividRet), mul: nearestBig)

        return roundToInt(multiRet)
    }
    static func nearRoundUp100(_ valueDec: Decimal) -> Int32 {
        let nearestBig = Decimal(integerLiteral: 100)

        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundUp(dividRet), mul: nearestBig)

        return roundToInt(multiRet)
    }

    static func nearRoundDown(_ valueDec: Decimal, nearest: Int32) -> Int32 {
        let nearestBig = Decimal(integerLiteral: Int(nearest))
        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundDown(dividRet), mul: nearestBig)

        return roundToInt(multiRet)
    }
    static func nearRoundDown100(_ valueDec: Decimal) -> Int32 {
        let nearestBig = Decimal(integerLiteral: 100)
        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundDown(dividRet), mul: nearestBig)

        return roundToInt(multiRet)
    }
    static func roundUp50(_ valueDec: Decimal) -> Int32 {
        let divider = Decimal(integerLiteral: 2)
        let dividRet = OperationsDec.divide(decRoundUp(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
        return roundToInt(dividRet)
    }
    static func roundUp25(_ valueDec: Decimal) -> Int32 {
        let divider = Decimal(integerLiteral: 4)
        let dividRet = OperationsDec.divide(decRoundUp(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
        return roundToInt(dividRet)
    }

    static func decRoundUp(_ valueDec: Decimal) -> Decimal {
        var roundInp = abs(valueDec)
        var roundRet = Decimal()
        NSDecimalRound(&roundRet, &roundInp, 0, NSDecimalNumber.RoundingMode.up)

        if valueDec < Decimal.zero {
            roundRet.negate()
            return roundRet
        }
        return roundRet
    }

    static func decRoundDown(_ valueDec: Decimal) -> Decimal {
        var roundInp = abs(valueDec)
        var roundRet = Decimal()
        NSDecimalRound(&roundRet, &roundInp, 0, NSDecimalNumber.RoundingMode.down)

        if valueDec < Decimal.zero {
            roundRet.negate()
            return roundRet
        }
        return roundRet
    }
    static func decRoundNorm(_ valueDec: Decimal) -> Decimal {
        var roundInp = abs(valueDec) + INT_ROUNDING_CONST
        var roundRet = Decimal()
        NSDecimalRound(&roundRet, &roundInp, 0, NSDecimalNumber.RoundingMode.down)

        if valueDec < Decimal.zero {
            roundRet.negate()
            return roundRet
        }
        return roundRet
    }

    static func decNearRoundUp(_ valueDec: Decimal, nearest: Int32) -> Decimal {
        let nearestBig = Decimal(integerLiteral: Int(nearest))
        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundUp(dividRet), mul: nearestBig)

        return multiRet
    }
    static func decNearRoundUp100(_ valueDec: Decimal) -> Decimal {
        let nearestBig = Decimal(integerLiteral: 100)
        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundUp(dividRet), mul: nearestBig)

        return multiRet
    }

    static func decNearRoundDown(_ valueDec: Decimal, nearest: Int32) -> Decimal {
        let nearestBig = Decimal(integerLiteral: Int(nearest))
        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundDown(dividRet), mul: nearestBig)

        return multiRet
    }
    static func decNearRoundDown100(_ valueDec: Decimal) -> Decimal {
        let nearestBig = Decimal(integerLiteral: 100)
        let dividRet = OperationsDec.divide(valueDec, div: nearestBig)

        let multiRet = OperationsDec.multiply(decRoundDown(dividRet), mul: nearestBig)

        return multiRet
    }
    static func decRoundUp50(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 2)
        return OperationsDec.divide(decRoundUp(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundUp25(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 4)
        return OperationsDec.divide(decRoundUp(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundUp01(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 100)
        return OperationsDec.divide(decRoundUp(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundDown50(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 2)
        return OperationsDec.divide(decRoundDown(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundDown25(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 4)
        return OperationsDec.divide(decRoundDown(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundDown01(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 100)
        return OperationsDec.divide(decRoundDown(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundNorm50(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 2)
        return OperationsDec.divide(decRoundNorm(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundNorm25(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 4)
        return OperationsDec.divide(decRoundNorm(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
    static func decRoundNorm01(_ valueDec: Decimal) -> Decimal {
        let divider = Decimal(integerLiteral: 100)
        return OperationsDec.divide(decRoundNorm(OperationsDec.multiply(valueDec, mul: divider)), div: divider)
    }
}
