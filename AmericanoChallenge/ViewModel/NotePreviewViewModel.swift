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
    var date: String
    
    init(previewImage: Data, title: String, date: String) {
        self.id = UUID()
        self.previewImage = previewImage
        self.title = title
        self.date = date
    }
}
