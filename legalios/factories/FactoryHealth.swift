//
// Created by Ladislav Lisy on 28.06.2021.
//

import Foundation

class FactoryHealth : ProviderFactory<PropsHealthBase, ProviderHealth> {
    init() {
        super.init(
                defaultProvider: ProviderHealth2022(),
                emptyPeriodProps: PropsHealth.empty(),
                versions: [
                    HistoryConstHealth2010.VERSION_CODE:ProviderHealth2010(),
                    HistoryConstHealth2011.VERSION_CODE:ProviderHealth2011(),
                    HistoryConstHealth2012.VERSION_CODE:ProviderHealth2012(),
                    HistoryConstHealth2013.VERSION_CODE:ProviderHealth2013(),
                    HistoryConstHealth2014.VERSION_CODE:ProviderHealth2014(),
                    HistoryConstHealth2015.VERSION_CODE:ProviderHealth2015(),
                    HistoryConstHealth2016.VERSION_CODE:ProviderHealth2016(),
                    HistoryConstHealth2017.VERSION_CODE:ProviderHealth2017(),
                    HistoryConstHealth2018.VERSION_CODE:ProviderHealth2018(),
                    HistoryConstHealth2019.VERSION_CODE:ProviderHealth2019(),
                    HistoryConstHealth2020.VERSION_CODE:ProviderHealth2020(),
                    HistoryConstHealth2021.VERSION_CODE:ProviderHealth2021(),
                    HistoryConstHealth2022.VERSION_CODE:ProviderHealth2022(),
                ])
    }
}
