//
//  NoteGridViewModel.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import Foundation

@Observable
class NoteGridViewModel {
    var notesPreviews: [String: [NotePreviewViewModel]]
    let predefinedOrder = {
        var predefinedOrder: [String] = [.today, .yesterday, .lastSevenDays, .lastThirtyDays]
        predefinedOrder.append(contentsOf: String.monthsOfTheYear)
        return predefinedOrder
       }()
    
    init(notesPreviews: [String: [NotePreviewViewModel]]) {
        self.notesPreviews = notesPreviews
    }
    
    var sortedSectionKeys: [String] {
        let filteredPredefinedOrder = predefinedOrder.filter { notesPreviews.keys.contains($0) }
        let yearKeys = notesPreviews.keys.filter { $0.isNumber }.sorted(by: >)
        return filteredPredefinedOrder + yearKeys
    }
}

extension String {
    var isNumber: Bool {
        return Double(self) != nil
    }
}
