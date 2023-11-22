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
    var allNotes: [Note] = []
    
    init(modelContainerDataManager: ModelContainerDataManager = ModelContainerDataManager.shared) {
        self.dataSource = modelContainerDataManager
        self.allNotes = modelContainerDataManager.fetchNotes()
        
        //TODO: togliere
//        if let imgData = Image.getImageDataFromAsset("imgProva") {
//            allNotes = ViewProva.notesProva(imgData: imgData)
//        }
    }
    
    func appendNote(_ note: Note) {
        allNotes.append(note)
        dataSource.appendNote(note)
    }
    
    func removeNote(_ index: Int) {
        allNotes.remove(at: index)
        dataSource.removeNote(allNotes[index])
    }
    
    func getNotesPreviewsGridSections(_ searchText: String = "") -> [String: [Note]] {
        var sections: [String: [Note]] = [:]
        
        if searchText.isEmpty {
            for note in allNotes {
                let sectionTitle = note.date.getNotesGridSectionTitle()
                
                if sections[sectionTitle] == nil {
                    sections[sectionTitle] = [note]
                } else {
                    sections[sectionTitle]?.append(note)
                }
            }
            return sections
        } else {
            let filteredNotes = allNotes.filter { note in
                note.title.lowercased().contains(searchText.lowercased())
            }
            sections[.researchResults] = filteredNotes
            return sections
        }
    }

}
