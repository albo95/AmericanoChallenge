//
//  AllNotesViewModel.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation
import SwiftData

//TODO: togliere
import SwiftUI

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
        
        //TODO: togliere
        if let imgData = Image.getImageDataFromAsset("imgProva") {
            allNotesPreviews = ViewProva.notesPreviewsProva(imgData: imgData)
        }
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
    
    func getNotesPreviewsGridSections() -> [String: [NotePreviewViewModel]] {
        var sections: [String: [NotePreviewViewModel]] = [:]

        for notePreview in allNotesPreviews {
            let sectionTitle = notePreview.date.getNotesGridSectionTitle()

            if sections[sectionTitle] == nil {
                sections[sectionTitle] = [notePreview]
            } else {
                sections[sectionTitle]?.append(notePreview)
            }
        }
        return sections
    }

}
