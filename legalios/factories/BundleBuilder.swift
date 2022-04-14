//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class BundleBuilder: IBundleBuilder {
    init() {
        // TODD: Cannot assign value of type 'FactoryHealth' to type 'some IBuilderFactoryHealth'
        salaryFactory = FactorySalary()
        healthFactory = FactoryHealth()
        socialFactory = FactorySocial()
        taxingFactory = FactoryTaxing()
    }
    func getBundle(_ period: IPeriod) -> IBundleProps? {
        let salary: IPropsSalary? = getSalaryProps(period)
        let health: IPropsHealth? = getHealthProps(period)
        let social: IPropsSocial? = getSocialProps(period)
        let taxing: IPropsTaxing? = getTaxingProps(period)

        if (BundleBuilder.isValidBundle(salary: salary, health: health, social: social, taxing: taxing)) {
            return BundleProps(periodProps: period,
                    salaryProps: salary!,
                    healthProps: health!,
                    socialProps: social!,
                    taxingProps: taxing!)
        }
        return nil
    }

    private func getSalaryProps(_ period: IPeriod) -> IPropsSalary {
        return salaryFactory.getProps(period)
    }

    private func getHealthProps(_ period: IPeriod) -> IPropsHealth {
        return healthFactory.getProps(period)
    }

    private func getSocialProps(_ period: IPeriod) -> IPropsSocial {
        return socialFactory.getProps(period)
    }

    private func getTaxingProps(_ period: IPeriod) -> IPropsTaxing {
        return taxingFactory.getProps(period)
    }

    static let MIN_VERSION: Int16 = 2010

    private static func isNullOrEmpty(props : IProps?) -> Bool {
        return (props != nil && (props?.version.value ?? 0) < BundleBuilder.MIN_VERSION)
    }

    private static func isValidBundle(
            salary: IProps?,
            health: IProps?,
            social: IProps?,
            taxing: IProps?) -> Bool {
        if (isNullOrEmpty(props: salary)) {
            return false
        }
        if (isNullOrEmpty(props: health)) {
            return false
        }
        if (isNullOrEmpty(props: social)) {
            return false
        }
        if (isNullOrEmpty(props: taxing)) {
            return false
        }
        return true
    }

    // TODD: Property declares an opaque return type,
    // but has no initializer expression from which to infer an underlying type
    let salaryFactory : FactorySalary
    let healthFactory : FactoryHealth
    let socialFactory : FactorySocial
    let taxingFactory : FactoryTaxing
}
