import Foundation

class OperationsPeriod {
    static let TERM_BEG_FINISHED: Int16 = 32
    static let TERM_END_FINISHED: Int16 = 0
    static let WEEKSUN_SUNDAY: Int16 = 1
    static let WEEKMON_SUNDAY: Int16 = 7
    static let TIME_MULTIPLY_SIXTY: Int16 = 60
    static let WEEKDAYS_COUNT: Int16 = 7

    func newDate(year: Int16, month: Int16, day: Int16) -> Date {
        let dateComponents = DateComponents(year: Int(year), month: Int(month), day: Int(day), hour: 0, minute: 0, second: 0)

        let userCalendar = Calendar.current

        let dateItem: Date? = userCalendar.date(from: dateComponents)

        return dateItem!
    }

    func emptyMonthSchedule() -> Array<Int32> {
        return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    }

    func totalWeeksHours(template: Array<Int32>) -> Int32 {
        let result: Int32 = template.enumerated().reduce(Int32(0)) { (agr, x) in
            if x.offset < 7 {
                return agr + x.element
            }
            return agr
        }
        return result
    }
    func totalMonthHours(template: Array<Int32>) -> Int32 {
        let result: Int32 = template.enumerated().reduce(Int32(0)) { (agr, x) in
            if x.offset < 31 {
                return agr + x.element
            }
            return agr
        }
        return result
    }
    func daysInMonth(_ period: IPeriod) -> Int16 {
        let date = newDate(year: period.year, month: period.month, day: 1)

        let userCalendar = Calendar.current
        let range = userCalendar.range(of: .day, in: .month, for: date)!
        return Int16(range.count)
    }
    func dateOfMonth(period: IPeriod, dayOrdinal: Int16) -> Date {
        let periodDay: Int16 = min(max(1, dayOrdinal), daysInMonth(period))

        return newDate(year: period.year, month: period.month, day: periodDay)
    }
    func dayOfWeekMonToSun(periodDateCwd: Int16) -> Int16 {
        // DayOfWeek Sunday = 0,
        // Monday = 1, Tuesday = 2, Wednesday = 3, Thursday = 4, Friday = 5, Saturday = 6,
        var dayOfWeek: Int16 = 0
        switch periodDateCwd {
        case OperationsPeriod.WEEKSUN_SUNDAY:
            dayOfWeek = OperationsPeriod.WEEKMON_SUNDAY
            break
        default:
            dayOfWeek = max(0, periodDateCwd-1)
        }
        return dayOfWeek
    }
    func dayOfWeekFromOrdinal(dayOrdinal: Int16, periodBeginCwd: Int16) -> Int16 {
        // dayOrdinal 1..31
        // periodBeginCwd 1..7
        // dayOfWeek 1..7

        let dayOfWeek = (((dayOrdinal - 1) + (periodBeginCwd - 1)) % 7) + 1

        return dayOfWeek
    }

    func weekDayOfMonth(period: IPeriod, dayOrdinal: Int16) -> Int16 {
        let periodDate = dateOfMonth(period: period, dayOrdinal: dayOrdinal)

        let userCalendar = Calendar.current
        let periodDateCwd = userCalendar.component(.weekday, from: periodDate)

        return dayOfWeekMonToSun(periodDateCwd: Int16(periodDateCwd))
    }
    func dateFromInPeriod(period: IPeriod, dateFrom: Date?) -> Int16 {
        var dayTermFrom = OperationsPeriod.TERM_BEG_FINISHED

        let periodDateBeg = newDate(year: period.year, month: period.month, day: 1)

        if dateFrom != nil	{
            dayTermFrom = Int16(Calendar.current.dateComponents([.day], from: dateFrom!).day ?? Int(OperationsPeriod.TERM_BEG_FINISHED))
        }

        if dateFrom == nil || dateFrom! < periodDateBeg {
            dayTermFrom = 1
        }
        return dayTermFrom
    }

    func dateStopInPeriod(period: IPeriod, dateEnds: Date?) -> Int16 {
        var dayTermEnd = OperationsPeriod.TERM_END_FINISHED

        let daysPeriod = daysInMonth(period)

        let periodDateEnd = newDate(year: period.year, month: period.month, day: daysPeriod)

        if dateEnds != nil {
            dayTermEnd = Int16(Calendar.current.dateComponents([.day], from: dateEnds!).day ?? Int(OperationsPeriod.TERM_END_FINISHED))
        }

        if dateEnds == nil || dateEnds! > periodDateEnd {
            dayTermEnd = daysPeriod
        }
        return dayTermEnd
    }
    func timesheetWeekSchedule(period: IPeriod, secondsWeekly: Int32, workdaysWeekly: Int16) -> Array<Int32> {
        let secondsDaily = secondsWeekly / Int32(min(workdaysWeekly, OperationsPeriod.WEEKDAYS_COUNT))

        let secRemainder = secondsWeekly - (secondsDaily * Int32(workdaysWeekly))

        let weekSchedule = [
            weekDaySeconds(dayOrdinal: 1, daysOfWork: workdaysWeekly, secondsDaily: secondsDaily, secRemainder: secRemainder),
            weekDaySeconds(dayOrdinal: 2, daysOfWork: workdaysWeekly, secondsDaily: secondsDaily, secRemainder: secRemainder),
            weekDaySeconds(dayOrdinal: 3, daysOfWork: workdaysWeekly, secondsDaily: secondsDaily, secRemainder: secRemainder),
            weekDaySeconds(dayOrdinal: 4, daysOfWork: workdaysWeekly, secondsDaily: secondsDaily, secRemainder: secRemainder),
            weekDaySeconds(dayOrdinal: 5, daysOfWork: workdaysWeekly, secondsDaily: secondsDaily, secRemainder: secRemainder),
            weekDaySeconds(dayOrdinal: 6, daysOfWork: workdaysWeekly, secondsDaily: secondsDaily, secRemainder: secRemainder),
            weekDaySeconds(dayOrdinal: 7, daysOfWork: workdaysWeekly, secondsDaily: secondsDaily, secRemainder: secRemainder),
        ]

        return weekSchedule
    }
    func weekDaySeconds(dayOrdinal: Int16, daysOfWork: Int16, secondsDaily: Int32, secRemainder: Int32) -> Int32 {
        if dayOrdinal < daysOfWork {
            return secondsDaily
        } else {
            if dayOrdinal == daysOfWork {
                return secondsDaily + secRemainder
            }
        }
        return 0
    }
    func timesheetFullSchedule(period: IPeriod, weekSchedule: Array<Int32>) -> Array<Int32> {
        let periodDaysCount = daysInMonth(period)

        let periodBeginCwd = weekDayOfMonth(period: period, dayOrdinal: 1)

        let monthSchedule: Array<Int32> = (1...periodDaysCount)
                .map { x in secondsFromWeekSchedule(weekSchedule: weekSchedule, dayOrdinal: x, periodBeginCwd: periodBeginCwd) }
        return monthSchedule
    }
    func timesheetWorkSchedule(monthSchedule: Array<Int32>, dayTermFrom: Int16, dayTermStop: Int16) -> Array<Int32> {
        let timeSheet: Array<Int32> = monthSchedule.enumerated()
                .map { idx, x in hoursFromCalendar(dayTermFrom: dayTermFrom, dayTermStop: dayTermStop, dayIndex: Int16(idx), workSeconds: x) }
        return timeSheet
    }
    func timesheetWorkContract(monthContract: Array<Int32>, monthPosition: Array<Int32>, dayTermFrom: Int16, dayTermStop: Int16) -> Array<Int32> {
        let idxFrom = Int(dayTermFrom - 1)
        let idxStop = Int(dayTermStop - 1)
        let result: Array<Int32> = zip(monthContract, monthPosition).enumerated().map { idx, x in
            var res: Int32 = 0
            if idx >= idxFrom && idx <= idxStop {
                res = x.0 + x.1
            }
            return res
        }
        return result
    }
    func secondsFromPeriodWeekSchedule(period: IPeriod, weekSchedule: Array<Int32>, dayOrdinal: Int16) -> Int32 {
        let periodBeginCwd = weekDayOfMonth(period: period, dayOrdinal: 1)

        return secondsFromWeekSchedule(weekSchedule: weekSchedule, dayOrdinal: dayOrdinal, periodBeginCwd: periodBeginCwd)
    }
    func secondsFromWeekSchedule(weekSchedule: Array<Int32>, dayOrdinal: Int16, periodBeginCwd: Int16) -> Int32 {
        let dayOfWeek = dayOfWeekFromOrdinal(dayOrdinal: dayOrdinal, periodBeginCwd: periodBeginCwd)

        let indexWeek = Int(dayOfWeek - 1)

        if indexWeek < 0 || indexWeek >= weekSchedule.count {
            return 0
        }
        return weekSchedule[indexWeek]
    }

    func secondsFromScheduleSeq(timeTable: Array<Int32>, dayOrdinal: Int16, dayFromOrd: Int16, dayEndsOrd: Int16) -> Int32 {
        if dayOrdinal < dayFromOrd || dayOrdinal > dayEndsOrd {
            return 0
        }

        let indexTable = Int(dayOrdinal - dayFromOrd)

        if indexTable < 0 || indexTable >= timeTable.count {
            return 0
        }

        return timeTable[indexTable]
    }
    func scheduleBaseSubtract(template: Array<Int32>, subtract: Array<Int32>, dayFrom: Int16, dayStop: Int16) -> Array<Int32> {
        let idxFrom = Int(dayFrom - 1)
        let idxStop = Int(dayStop - 1)
        let result: Array<Int32> = zip(template, subtract).enumerated().map { idx, x in
            var res: Int32 = 0
            if idx >= idxFrom && idx <= idxStop {
                res = max(0, x.0 - x.1)
            }
            return res
        }
        return result
    }
    func plusHoursFromCalendar(dayTermFrom: Int16, dayTermStop: Int16, dayIndex: Int16, partSeconds: Int32, workSeconds: Int32) -> Int32 {
        let dayOrdinal = dayIndex + 1

        var plusSeconds = workSeconds

        if dayTermFrom > dayOrdinal {
            plusSeconds = 0
        }
        if dayTermStop < dayOrdinal {
            plusSeconds = 0
        }
        return plusSeconds + partSeconds
    }
    func hoursFromCalendar(dayTermFrom: Int16, dayTermStop: Int16, dayIndex: Int16, workSeconds: Int32) -> Int32 {
        let dayOrdinal = dayIndex + 1

        var workingDay = workSeconds

        if dayTermFrom > dayOrdinal {
            workingDay = 0
        }
        if dayTermStop < dayOrdinal {
            workingDay = 0
        }
        return workingDay
    }
}
