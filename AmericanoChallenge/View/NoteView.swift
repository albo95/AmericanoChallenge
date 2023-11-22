//
//  NoteView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation
import SwiftUI
import SwiftData

struct NoteView: View {
    var note: Note
    
    var body: some View {
        Text("\(note.title) \(note.date.getNotePreviewDateLabel()) ")
    }
}

#Preview {
    if let imgData = Image.getImageDataFromAsset("imgProva") {
        return NoteView(note: ViewProva.noteProva(imgData: imgData))
    } else {
        return AnyView(Text("Preview not available"))
    }
}
