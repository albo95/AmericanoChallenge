//
//  NoteListSectionView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import SwiftUI

import SwiftUI

struct NoteGridView: View {
    var viewModel: NoteGridViewModel
    
    let sectionHeaderTopPadding: CGFloat = 10
    let notesPreviewVerticalPadding: CGFloat = 15
    let VerticalPadding: CGFloat = 30
    
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        LazyVGrid(
            columns: columns) {
                ForEach(viewModel.sortedSectionKeys, id: \.self) { key in
                    Section(
                        header:SectionHeaderView(title: key).padding(.top, sectionHeaderTopPadding))
                    {
                        ForEach(viewModel.notesPreviews[key] ?? [], id: \.self) { notePreview in
                            NotePreviewView(model: notePreview)
                                .padding(.bottom, notesPreviewVerticalPadding)
                        }
                    }
                }
            }
    }
    
    struct SectionHeaderView: View{
        var title: String
        
        var body: some View {
            HStack{
                Text(title)
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                Spacer()
            }.padding(.leading)
        }
    }
}

#Preview {
    if let imgData = Image.getImageDataFromAsset("imgProva") {
        return NoteGridView(viewModel: NoteGridViewModel(notesPreviews: [.november:[NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday")],
                                                                         
            .yesterday:[NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday")],
                                                                         
            .today:[NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"), NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday"),NotePreviewViewModel(previewImage: imgData, title: "Note Name", date: "Yesterday")]
                                                                        ]))
    } else {
        return AnyView(Text("Preview not available"))
    }
}
