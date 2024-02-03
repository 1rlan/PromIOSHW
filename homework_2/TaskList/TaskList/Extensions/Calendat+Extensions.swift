//
//  Calendat+Extensions.swift
//  TaskList
//
//  Created by Irlan Abushakhmanov on 02.02.2024.
//

import Foundation

extension Calendar {
    private var currentDate: Date { return Date() }

    func isDateInThisWeek(_ date: Date) -> Bool {
        return isDate(date, equalTo: currentDate, toGranularity: .weekOfYear)
    }
}
