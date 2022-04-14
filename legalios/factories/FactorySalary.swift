//
// Created by Ladislav Lisy on 29.06.2021.
//

import Foundation

class FactorySalary : ProviderFactory<PropsSalary, ProviderSalary> {
    init() {
        super.init(
                defaultProvider: ProviderSalary2022(),
                emptyPeriodProps: PropsSalary.empty(),
                versions: [
                    HistoryConstSalary2010.VERSION_CODE:ProviderSalary2010(),
                    HistoryConstSalary2011.VERSION_CODE:ProviderSalary2011(),
                    HistoryConstSalary2012.VERSION_CODE:ProviderSalary2012(),
                    HistoryConstSalary2013.VERSION_CODE:ProviderSalary2013(),
                    HistoryConstSalary2014.VERSION_CODE:ProviderSalary2014(),
                    HistoryConstSalary2015.VERSION_CODE:ProviderSalary2015(),
                    HistoryConstSalary2016.VERSION_CODE:ProviderSalary2016(),
                    HistoryConstSalary2017.VERSION_CODE:ProviderSalary2017(),
                    HistoryConstSalary2018.VERSION_CODE:ProviderSalary2018(),
                    HistoryConstSalary2019.VERSION_CODE:ProviderSalary2019(),
                    HistoryConstSalary2020.VERSION_CODE:ProviderSalary2020(),
                    HistoryConstSalary2021.VERSION_CODE:ProviderSalary2021(),
                    HistoryConstSalary2022.VERSION_CODE:ProviderSalary2022(),
                ])
    }
}

