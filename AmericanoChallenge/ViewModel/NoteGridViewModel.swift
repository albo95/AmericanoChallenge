//
//  NoteGridViewModel.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import Foundation

@Observable
class NoteGridViewModel {
    var notes: [String: [Note]]
    
    let predefinedOrder = {
        var predefinedOrder: [String] = [.researchResults, .today, .yesterday, .lastSevenDays, .lastThirtyDays]
        predefinedOrder.append(contentsOf: String.monthsOfTheYear)
        return predefinedOrder
       }()
    
    init(notes: [String: [Note]]) {
        self.notes = notes
    }
    
    var sortedSectionKeys: [String] {
        let filteredPredefinedOrder = predefinedOrder.filter { notes.keys.contains($0) }
        let yearKeys = notes.keys.filter { $0.isNumber }.sorted(by: >)
        return filteredPredefinedOrder + yearKeys
    }
}

extension String {
    var isNumber: Bool {
        return Double(self) != nil
    }
}
