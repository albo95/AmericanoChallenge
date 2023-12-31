//
//  Item.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 14/11/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Note {
    @Attribute(.unique) var id = UUID()
    var title: String
    var date: Date
    @Relationship(deleteRule: .cascade)
    var content: [NoteElement]
    var previewImage: Data?
    
    init(id: UUID = UUID(), title: String? = nil, date: Date = Date.now, content: [NoteElement] = [], previewImage: Data? = nil) {
        self.id = id
        self.date = date
        self.title = title ?? "Nota del \(date.getFormattedDateString())"
        self.content = content
        if previewImage == nil, let imgData = Image.getImageDataFromAsset("noteDefaultPreview") {
            self.previewImage = imgData
        } else {
            self.previewImage = previewImage
        }
    }
}

@Model
final class NoteElement {
    @Attribute(.unique) var id = UUID()
    var position: Float
    @Relationship(deleteRule: .cascade)
    var data: NoteData
    
    required init(id: UUID, position: Float, data: NoteData) {
        self.id = id
        self.position = position
        self.data = data
    }
}

enum NoteData: Codable {
    typealias DrawingData = Data
    typealias TextData = String

    case drawing(DrawingData)
    case text(TextData)

    init(drawingData: DrawingData = DrawingData()) {
        self = .drawing(drawingData)
    }

    init(textData: TextData = TextData()) {
        self = .text(textData)
    }

    func getData() -> Any {
        switch self {
        case .drawing(let drawingData):
            return drawingData
        case .text(let textData):
            return textData
        }
    }
}




