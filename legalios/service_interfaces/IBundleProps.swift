//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public protocol IBundleProps {
    var periodProps: IPeriod { get }
    var salaryProps: IPropsSalary? { get }
    var healthProps: IPropsHealth? { get }
    var socialProps: IPropsSocial? { get }
    var taxingProps: IPropsTaxing? { get }

    func getPeriodYear() -> Int16
    func getPeriodMonth() -> Int16
    func getPeriodCode() -> Int32
}
