//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class FactoryTaxing : ProviderFactory<PropsTaxingBase, ProviderTaxing> {
    init() {
        super.init(
                defaultProvider: ProviderTaxing2022(),
                emptyPeriodProps: PropsTaxing.empty(),
                versions: [
                    HistoryConstTaxing2010.VERSION_CODE:ProviderTaxing2010(),
                    HistoryConstTaxing2011.VERSION_CODE:ProviderTaxing2011(),
                    HistoryConstTaxing2012.VERSION_CODE:ProviderTaxing2012(),
                    HistoryConstTaxing2013.VERSION_CODE:ProviderTaxing2013(),
                    HistoryConstTaxing2014.VERSION_CODE:ProviderTaxing2014(),
                    HistoryConstTaxing2015.VERSION_CODE:ProviderTaxing2015(),
                    HistoryConstTaxing2016.VERSION_CODE:ProviderTaxing2016(),
                    HistoryConstTaxing2017.VERSION_CODE:ProviderTaxing2017(),
                    HistoryConstTaxing2018.VERSION_CODE:ProviderTaxing2018(),
                    HistoryConstTaxing2019.VERSION_CODE:ProviderTaxing2019(),
                    HistoryConstTaxing2020.VERSION_CODE:ProviderTaxing2020(),
                    HistoryConstTaxing2021.VERSION_CODE:ProviderTaxing2021(),
                    HistoryConstTaxing2022.VERSION_CODE:ProviderTaxing2022(),
                ])
    }
}

