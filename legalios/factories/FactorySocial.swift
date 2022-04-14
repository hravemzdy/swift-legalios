//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class FactorySocial : ProviderFactory<PropsSocialBase, ProviderSocial> {
    init() {
        super.init(
                defaultProvider: ProviderSocial2022(),
                emptyPeriodProps: PropsSocial.empty(),
                versions: [
                    HistoryConstSocial2010.VERSION_CODE:ProviderSocial2010(),
                    HistoryConstSocial2011.VERSION_CODE:ProviderSocial2011(),
                    HistoryConstSocial2012.VERSION_CODE:ProviderSocial2012(),
                    HistoryConstSocial2013.VERSION_CODE:ProviderSocial2013(),
                    HistoryConstSocial2014.VERSION_CODE:ProviderSocial2014(),
                    HistoryConstSocial2015.VERSION_CODE:ProviderSocial2015(),
                    HistoryConstSocial2016.VERSION_CODE:ProviderSocial2016(),
                    HistoryConstSocial2017.VERSION_CODE:ProviderSocial2017(),
                    HistoryConstSocial2018.VERSION_CODE:ProviderSocial2018(),
                    HistoryConstSocial2019.VERSION_CODE:ProviderSocial2019(),
                    HistoryConstSocial2020.VERSION_CODE:ProviderSocial2020(),
                    HistoryConstSocial2021.VERSION_CODE:ProviderSocial2021(),
                    HistoryConstSocial2022.VERSION_CODE:ProviderSocial2022(),
                ])
    }
}

