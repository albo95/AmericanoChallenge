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
    @State var isDrawing: Bool = true
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationStack {
            Text(note.date.getFormattedDateString())
          
            
            DrawingCanvasView(isDrawing: $isDrawing).toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    NoteToolbarViewItems(isDrawing: $isDrawing)
                }
                
                if isDrawing {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Fine") {
                            isDrawing = false
                        }
                    }
                } else {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            //TODO: aggiungere azione bottone ell
                        }, label: {
                            Image(systemName: "ellipsis.circle")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    if let imgData = Image.getImageDataFromAsset("imgProva") {
        return NoteView(note: ViewProva.noteProva(imgData: imgData), path: .constant(NavigationPath()))
    } else {
        return AnyView(Text("Preview not available"))
    }
}
