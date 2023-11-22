//
//  Prove.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation

class ViewProva {
    static func notesGridProva (imgData: Data) -> NotesGridView {
        return NotesGridView(viewModel: NoteGridViewModel(notes: [.november: ViewProva.notesProva(imgData: imgData),
            .yesterday: ViewProva.notesProva(imgData: imgData),
            .today: ViewProva.notesProva(imgData: imgData)]))}
    
    static func noteProva(imgData: Data) ->  Note {
        return Note(id: UUID(), title: "Note", date: Date.createRandomDate(), previewImage: imgData)
    }
    
    static func notesProva(imgData:Data) -> [Note] {
        return [ViewProva.noteProva(imgData: imgData),ViewProva.noteProva(imgData: imgData),ViewProva.noteProva(imgData: imgData),ViewProva.noteProva(imgData: imgData),ViewProva.noteProva(imgData: imgData),ViewProva.noteProva(imgData: imgData),ViewProva.noteProva(imgData: imgData)]
    }
}


