//
//  ContentView.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 14/11/23.
//

import SwiftUI
import SwiftData

struct AllNotesView: View {
    @State
    private var model: AllNotesViewModel = AllNotesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                NotesGridView(viewModel: NoteGridViewModel(notes: model.getNotesPreviewsGridSections()))
            }
            .navigationTitle("Note")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    AllNotesView()
}


