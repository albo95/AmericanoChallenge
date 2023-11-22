//
//  ExtensionDate.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation


extension Date {
    func getNotePreviewDateLabel() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(self) {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter.string(from: self)
        }
        
        if calendar.isDateInYesterday(self) {
            return .yesterday.lowercased()
        }
        
        if let aWeekAgo = calendar.date(byAdding: .day, value: -7, to: now),
           self >= aWeekAgo {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: self).lowercased()
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: self)
    }
    
    func getNotesGridSectionTitle() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(self) {
            return .today
        } else if calendar.isDateInYesterday(self) {
            return .yesterday
        } else if let aWeekAgo = calendar.date(byAdding: .day, value: -7, to: now), self >= aWeekAgo {
            return .lastSevenDays
        } else if let aMonthAgo = calendar.date(byAdding: .day, value: -30, to: now), self >= aMonthAgo {
            return .lastThirtyDays
        } else if let aYearAgo = calendar.date(byAdding: .year, value: -1, to: now), self >= aYearAgo {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"
            return formatter.string(from: self)
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            return formatter.string(from: self)
        }
    }
    
    static func createRandomDate() -> Date {
        let randomChoice = Int.random(in: 1...6)
        let calendar = Calendar.current
        let now = Date()
        
        switch randomChoice {
        case 1:
            var components = calendar.dateComponents([.year, .month, .day], from: now)
            components.hour = Int.random(in: 0...23)
            components.minute = Int.random(in: 0...59)
            components.second = Int.random(in: 0...59)
            return calendar.date(from: components)!
        case 2:
            return calendar.date(byAdding: .day, value: -1, to: now)!
        case 3:
            return calendar.date(byAdding: .day, value: Int.random(in: -6...0), to: now)!
        case 4:
            return calendar.date(byAdding: .day, value: Int.random(in: -29...0), to: now)!
        case 5:
            return calendar.date(byAdding: .day, value: Int.random(in: -364...0), to: now)!
        default:
            let pastYear = calendar.date(byAdding: .year, value: -1, to: now)!
            return calendar.date(byAdding: .day, value: Int.random(in: -365...0), to: pastYear)!
        }
    }
    
    func getFormattedDateString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "it_IT")
        formatter.dateFormat = "d MMMM yyyy 'alle ore' HH:mm"
        let dateString = formatter.string(from: self)
        return dateString
    }
    
}

