//
//  AmericanoChallengeApp.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 14/11/23.
//

import SwiftUI
import SwiftData
import Observation

@main
struct AmericanoChallengeApp: App {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    init() {
        let schema = Schema([Note.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            modelContext = modelContainer.mainContext
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
//            if let imgData = Image.getImageDataFromAsset("imgProva") {
//                NoteView(note: ViewProva.noteProva(imgData: imgData), path: .constant(NavigationPath()))
//            }
            AllNotesView()
        }
        .modelContext(modelContext)
        
    }
}
