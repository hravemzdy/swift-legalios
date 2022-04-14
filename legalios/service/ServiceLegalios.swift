//
// Created by Ladislav Lisy on 30.06.2021.
//

import Foundation

public class ServiceLegalios : IServiceLegalios {
    let builder: IBundleBuilder
    public init () {
        builder = BundleBuilder()
    }
    public func getBundle(_ period: IPeriod) -> Result<IBundleProps, HistoryResultError> {
        let bundle: IBundleProps? = builder.getBundle(period)

        if bundle == nil {
            let error = HistoryResultError.CreateBundleNullError()
            return .failure(error)
        }
        if bundle?.getPeriodCode() == 0 {
            let error = HistoryResultError.CreateBundleEmptyError()
            return .failure(error)
        }
        if bundle?.getPeriodCode() != period.code {
            let error = HistoryResultError.CreateBundleInvalidError()
            return .failure(error)
        }
        return .success(bundle!)
    }
}
