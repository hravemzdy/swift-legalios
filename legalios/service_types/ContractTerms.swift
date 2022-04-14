import Foundation

public enum WorkContractTerms : Int16 {
    case WorktermEmployment1 = 0
    case WorktermContracterA = 1
    case WorktermContracterT = 2
    case WorktermPartnerStat = 3
}

public enum WorkTaxingTerms : Int16 {
    case TaxingTermByContract = 0
    case TaxingTermEmployments = 1
    case TaxingTermAgreemTask = 2
    case TaxingTermStatutPart = 3
}

public enum WorkHealthTerms : Int16 {
    case HealthTermByContract = 0
    case HealthTermEmployments = 1
    case HealthTermAgreemWork = 2
    case HealthTermAgreemTask = 3
}

public enum WorkSocialTerms : Int16 {
    case SocialTermByContract = 0
    case SocialTermEmployments = 1
    case SocialTermSmallsEmpl = 2
    case SocialTermShortsMeet = 3
    case SocialTermShortsDeny = 4
    case SocialTermAgreemTask = 5
}

