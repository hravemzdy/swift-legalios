//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

public class BundleProps : IBundleProps {
    public init(periodProps: IPeriod,
        salaryProps: IPropsSalary,
        healthProps: IPropsHealth,
        socialProps: IPropsSocial,
        taxingProps: IPropsTaxing)
    {
        self.periodProps = periodProps
        self.salaryProps = salaryProps
        self.healthProps = healthProps
        self.socialProps = socialProps
        self.taxingProps = taxingProps
    }

    public let periodProps: IPeriod
    public let salaryProps: IPropsSalary?
    public let healthProps: IPropsHealth?
    public let socialProps: IPropsSocial?
    public let taxingProps: IPropsTaxing?

    public func getPeriodYear() -> Int16 {
        return periodProps.year
    }

    public func getPeriodMonth() -> Int16 {
        return periodProps.month
    }
    public func getPeriodCode() -> Int32 {
        return periodProps.code
    }
    public static func empty() -> IBundleProps {
        return BundleProps(periodProps: Period.zero(),
                salaryProps: PropsSalary.empty(),
                healthProps: PropsHealth.empty(),
                socialProps: PropsSocial.empty(),
                taxingProps: PropsTaxing.empty())
    }
}