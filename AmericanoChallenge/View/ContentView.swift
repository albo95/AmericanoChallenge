//
//  ContentView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 14/11/23.
//

import SwiftUI
import SwiftData

struct AllNotesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var notes: [Note]
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(notes, id: \.id) { note in
                    NavigationLink {
                        Text("\(note.title)")
                    } label: {
                        Text("\(note.title)")
                    }
                }
                .onDelete(perform: deleteNotes)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {
                        addNote(title: "", content: [])
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }

        } detail: {
            Text("Select an item")
        }
    }
    
    private func addNote(title: String, content: [NoteElement]) {
        withAnimation {
            let newNote = Note(id: UUID(), title: title, date: Date.now, content: content)
            modelContext.insert(newNote)
        }
    }

    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(notes[index])
            }
        }
    }
}

//#Preview {
//    //AllNotesView()
//}
