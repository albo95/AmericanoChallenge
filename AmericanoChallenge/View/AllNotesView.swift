//
//  ContentView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 14/11/23.
//

import SwiftUI
import SwiftData

struct AllNotesView: View {
    @State private var model: AllNotesViewModel = AllNotesViewModel()
    //@State var path: [Note] = [Note]()
    @State private var searchText = ""
    let sectionHeaderTopPadding: CGFloat = 10
    let notesPreviewVerticalPadding: CGFloat = 5
    let verticalPadding: CGFloat = 30
    @State private var isNoteAdded: Bool = false

    var body: some View {
        NavigationStack() {
            
            ScrollView {
                NavigationLink(destination: NoteView(note: model.allNotes.last ?? Note()), isActive: $isNoteAdded) {
                               EmptyView()
                           }
                NotesGridView(viewModel: NoteGridViewModel(notes: model.getNotesPreviewsGridSections(searchText)))
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar){
                    Spacer()
                    Text(getTabBarText()).font(.system(size: 12)).foregroundColor(.palette.mainText)
                    Spacer()
                    
                    Button(action: {
                                    let note = Note()
                                    model.appendNote(note)
                                    isNoteAdded = true // Attiva la navigazione
                                }, label: {
                                    Image(systemName: "square.and.pencil")
                                })
                    
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                    }, label: {
                        Image(systemName: "ellipsis.circle")})
                }
                
            }.foregroundColor(.palette.interaction)
            .navigationTitle("Note")
            .navigationBarTitleDisplayMode(.large)
        
        }.searchable(text: $searchText)
            .background(Color.palette.background)
    }
    
    private func getTabBarText() -> String{
        let noteCount = model.allNotes.count
        let noteOrNotes = noteCount == 1 ? "note" : "notes"
        return "\(noteCount) \(noteOrNotes)"
    }
}

#Preview {
    AllNotesView()
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

