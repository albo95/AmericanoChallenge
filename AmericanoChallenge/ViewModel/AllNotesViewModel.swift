//
//  AllNotesViewModel.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation
import SwiftData

@Observable
class AllNotesViewModel {
    @ObservationIgnored
    private let dataSource: ModelContainerDataManager
    private var allNotes: [Note] = []
    private var allNotesPreviews: [NotePreviewViewModel] = []
    
    init(modelContainerDataManager: ModelContainerDataManager = ModelContainerDataManager.shared) {
        self.dataSource = modelContainerDataManager
        self.allNotes = modelContainerDataManager.fetchNotes()
        createNotesPreviews()
    }
    
    private func createNotesPreviews() {
        for note in allNotes {
            allNotesPreviews.append(note.toNotePreview())
        }
    }
    
    func appendNote(_ note: Note) {
        dataSource.appendNote(note)
    }
    
    func removeNote(_ index: Int) {
        dataSource.removeNote(allNotes[index])
    }
    
    func getNotesPreviewsGridSections() -> [String : [NotePreviewViewModel]]? {
        return nil
    }
}
