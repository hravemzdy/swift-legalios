//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class ProviderFactory<BP: IProps, BB: IPropsProvider> : IProviderFactory {
    typealias FP = BP

    typealias VERSION = Int16

    let defaultProvider: BB

    let emptyPeriodProps : BP

    let versions : Dictionary<VERSION, BB>

    init(defaultProvider: BB, emptyPeriodProps: BP, versions: Dictionary<VERSION, BB>) {
        self.defaultProvider = defaultProvider
        self.emptyPeriodProps = emptyPeriodProps
        self.versions = versions
    }

    func getProps<BP>(_ period: IPeriod) -> BP {
        let provider: BB? = getProvider(period: period, defProvider: defaultProvider)
        if (provider == nil) {
            return (emptyPeriodProps as! BP)
        }
        // TODD: Type of expression is ambiguous without more context
        return (provider!).getProps(period)
    }

    func getProvider(period: IPeriod, defProvider: BB) -> BB? {
        let maybeProvider: BB? = versions[period.year]
        if (maybeProvider == nil) {
            if (period.year > defProvider.version.value) {
                return defProvider
            }
            return nil
        }
        let provider: BB = maybeProvider!
        if (period.year != provider.version.value) {
            return nil
        }
        return provider
    }
}