//
//  Date+Helper.swift
//  DRCPractical
//
//  Created by Hemen on 09/03/22.
//

import Foundation

extension Locale {
    static let ptBR = Locale(identifier: "pt_BR")
}

extension Formatter {
    static let date = DateFormatter()
}

extension Date {
    func localizedDescription(date dateStyle: DateFormatter.Style = .medium,
                              time timeStyle: DateFormatter.Style = .medium,
                              in timeZone: TimeZone = .current,
                              locale: Locale = .current,
                              using calendar: Calendar = .current) -> String {
        Formatter.date.calendar = calendar
        Formatter.date.locale = locale
        Formatter.date.timeZone = timeZone
        Formatter.date.dateStyle = dateStyle
        Formatter.date.timeStyle = timeStyle
        return Formatter.date.string(from: self)
    }
    var localizedDescription: String { localizedDescription() }
}
