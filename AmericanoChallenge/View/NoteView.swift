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
    
    var body: some View {
        NavigationStack {
            Text(note.date.getFormattedDateString()).font(.system(size: 14)).foregroundColor(.palette.secondaryTextColor)
            
            DrawingCanvasView(isDrawing: $isDrawing).toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        isDrawing.toggle()
                    }, label: {
                        Image(systemName: "pencil.tip.crop.circle")})
                    
                    Spacer()
                    
                    Button(action: {
                        let note: Note = Note()
                       
                    }, label: {
                        Image(systemName: "square.and.pencil")})
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    
                    Button(action: {}) {
                        Image(systemName: "arrow.uturn.backward.circle")
                    }
                    
                    Button(action: {}) {
                        Image(systemName:"arrow.uturn.right.circle")
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis.circle")
                    }
                    
                    Button("Fine") {
                        isDrawing = false
                    }
                    
                 
                }
            }.foregroundColor(.interaction)
        }
    }
}

#Preview {
    if let imgData = Image.getImageDataFromAsset("imgProva") {
        return NoteView(note: ViewProva.noteProva(imgData: imgData))
    } else {
        return AnyView(Text("Preview not available"))
    }
}
