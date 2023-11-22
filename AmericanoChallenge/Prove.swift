//
//  Prove.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation

class viewProva {
    static func notesGridProva (imgData: Data) -> NotesGridView {
       return NotesGridView(viewModel: NoteGridViewModel(notesPreviews: [.november:[NotePreviewViewModel(previewImage: imgData, title: "Note", date: Date.createDate()), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate()),NotePreviewViewModel(previewImage: imgData, title: "Note", date: Date.createDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate())],
                                                                   
            .yesterday:[NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate()), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate())],
                                                                   
            .today:[NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate()), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate()),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: Date.createDate())]
                                                                  ]))}
    }


