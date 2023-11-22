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
            formatter.timeStyle = .short
            return formatter.string(from: self)
        }
        
        if calendar.isDateInYesterday(self) {
            return .yesterday
        }
        
        if let aWeekAgo = calendar.date(byAdding: .day, value: -7, to: now),
           self >= aWeekAgo {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: self)
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter.string(from: self)
    }
    
    func getNotesGridSectionTitle() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(self) {
            return "Today"
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday"
        } else if let aWeekAgo = calendar.date(byAdding: .day, value: -7, to: now), self >= aWeekAgo {
            return "Last 7 days"
        } else if let aMonthAgo = calendar.date(byAdding: .day, value: -30, to: now), self >= aMonthAgo {
            return "Last 30 days"
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
    
    static func createDate(_ dateString: String = "17/02/2022 17:31:34") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "it_IT")
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
            return Date(timeIntervalSince1970: 3963491)
        }
    }
    
}

