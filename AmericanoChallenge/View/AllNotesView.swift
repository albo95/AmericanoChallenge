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
    @State var path: NavigationPath = NavigationPath()
    @State private var searchText = ""

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                NotesGridView(viewModel: NoteGridViewModel(notes: model.getNotesPreviewsGridSections(searchText)), path: $path)
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar){
                    Spacer()
                    Text(getTabBarText()).font(.system(size: 12)).foregroundColor(.palette.mainText)
                    Spacer()
                    Button(action: {
                        let note: Note = Note()
                        model.appendNote(note)
                        path.removeLast(path.count)
                        path.append(note)
                    }, label: {
                        Image(systemName: "square.and.pencil")})
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                    }, label: {
                        Image(systemName: "ellipsis.circle")})
                }
            }.foregroundColor(.palette.interaction)
            .navigationTitle("Note")
            .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: Note.self, destination: {
                note in NoteView(note: note, path: .constant(NavigationPath()))
            })
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


