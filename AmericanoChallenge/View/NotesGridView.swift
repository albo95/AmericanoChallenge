//
//  NoteListSectionView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 20/11/23.
//

import SwiftUI

struct NotesGridView: View {
    var viewModel: NoteGridViewModel
    let sectionHeaderTopPadding: CGFloat = 10
    let notesPreviewVerticalPadding: CGFloat = 5
    let verticalPadding: CGFloat = 30

    
    var body: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        NavigationStack {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.sortedSectionKeys, id: \.self) { key in
                            Section(header: SectionHeaderView(title: key)
                                    .padding(.top, sectionHeaderTopPadding)
                                    .foregroundColor(.palette.mainText)) {
                                ForEach(viewModel.notes[key] ?? [], id: \.self) { note in
                                    NavigationLink(destination: NoteView(note: note)) {
                                        NotePreviewView(note: note)
                                            .padding(.bottom, notesPreviewVerticalPadding)
                                            .frame(alignment: .top)
                                    }
                                }
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
        return ViewProva.notesGridProva(imgData: imgData)
    } else {
        return AnyView(Text("Preview not available"))
    }
}
