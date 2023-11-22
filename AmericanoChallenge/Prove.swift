//
//  Prove.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation

class ViewProva {
    static func notesGridProva (imgData: Data) -> NotesGridView {
       return NotesGridView(viewModel: NoteGridViewModel(notesPreviews: [.november:[NotePreviewViewModel(previewImage: imgData, title: "Note", date: Date.createRandomDate()), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate()),NotePreviewViewModel(previewImage: imgData, title: "Note", date: Date.createRandomDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate())],
                                                                   
            .yesterday:[NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate()), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate())],
                                                                   
            .today:[NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate()), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createRandomDate())]
             
                                                                        
                                                                        ]))}
    
    static func notePreviewProva(imgData: Data) ->  NotePreviewViewModel {
        return NotePreviewViewModel(previewImage: imgData, title: "Note", date: Date.createRandomDate())
    }
    
    static func notesPreviewsProva(imgData:Data) -> [NotePreviewViewModel] {
        return [ViewProva.notePreviewProva(imgData: imgData), ViewProva.notePreviewProva(imgData: imgData), ViewProva.notePreviewProva(imgData: imgData), ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData),ViewProva.notePreviewProva(imgData: imgData)]
    }
}


