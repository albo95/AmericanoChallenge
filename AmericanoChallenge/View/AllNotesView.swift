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
                if let imgData = Image.getImageDataFromAsset("imgProva") {
                    viewProva.notesGridProva(imgData: imgData)
                }
            }
            .navigationTitle("Note")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    AllNotesView()
}


