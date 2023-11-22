//
//  NoteCellViewModel.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import Foundation

struct NotePreviewViewModel: Identifiable, Hashable {
    var id: UUID
    var previewImage: Data
    var title: String
    var date: Date
    
    init(previewImage: Data, title: String, date: Date) {
        self.id = UUID()
        self.previewImage = previewImage
        self.title = title
        self.date = date
    }
}
