//
//  NoteCellView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import Foundation
import SwiftUI

struct NotePreviewView: View {
    @State var note: Note
    
    let textWidthSize: CGFloat = 85
    let previewImageWidthSize: CGFloat = 90
    let previewImageHeightSize: CGFloat = 80
    let previewNoteHeightSize: CGFloat = 150
    
    var body: some View {
        VStack
        {
            if let noteImage = note.previewImage, let image = Image.createFromData(noteImage){
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: previewImageWidthSize, height: previewImageHeightSize)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
            }
            Text(note.title)
                .multilineTextAlignment(.center)
                .foregroundStyle(.mainText)
                .font(.headline)
                .lineLimit(2)
                .frame(width: textWidthSize)
            Text(note.date.getNotePreviewDateLabel())
                .foregroundStyle(.secondaryText)
                .font(.subheadline)
                .lineLimit(1)
        }.frame(width: previewImageWidthSize, height: previewNoteHeightSize, alignment: .top)
    }
}

#Preview {
    if let imgData = Image.getImageDataFromAsset("imgProva") {
        return AnyView(NotePreviewView(note: Note(id: UUID(), title: "Noteaa aaaa", date: Date.createRandomDate(), previewImage: imgData)))
    } else {
        return AnyView(Text("Preview not available"))
    }
}


