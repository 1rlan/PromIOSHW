//
//  DateService.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import Foundation

final class DateService {
    private let calendar = Calendar.current

    func format(date: Date) -> String {
        let formatter = DateFormatter()

        if calendar.isDateInToday(date) {
            formatter.dateFormat = "h:mm a"
            return "Today, " + formatter.string(from: date)
        } else if calendar.isDateInTomorrow(date) {
            formatter.dateFormat = "h:mm a"
            return "Tomorrow, " + formatter.string(from: date)
        } else if calendar.isDateInThisWeek(date) {
            formatter.dateFormat = "EEEE, h:mm a"
            return formatter.string(from: date)
        } else {
            formatter.dateFormat = "MMMM d, h:mm a"
            return formatter.string(from: date)
        }
    }

    func isToday(date: Date) -> Bool {
        calendar.isDateInToday(date)
    }
}
