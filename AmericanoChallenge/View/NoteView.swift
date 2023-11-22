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
    @State var isDrawing: Bool = false
    @Binding var path: NavigationPath
    
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
                        path.removeLast(path.count)
                        path.append(note)
                    }, label: {
                        Image(systemName: "square.and.pencil")})
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
            }.foregroundColor(.interaction)
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
