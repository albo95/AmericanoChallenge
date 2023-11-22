//
//  ModelContainerDataManager.swift
//  AmericanoChallenge
//
//  Created by Alberto Bruno on 22/11/23.
//

import Foundation
import SwiftData

final class ModelContainerDataManager {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = ModelContainerDataManager()
    
    @MainActor
    private init() {
        let schema = Schema([Note.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            self.modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            self.modelContext = modelContainer.mainContext
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func appendNote(_ note: Note) {
        modelContext.insert(note)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchNotes() -> [Note] {
        let fetchDescriptorDateSort = FetchDescriptor<Note>(sortBy: [SortDescriptor(\.date)])

        do {
            return try modelContext.fetch(fetchDescriptorDateSort)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func removeNote(_ note: Note) {
        modelContext.delete(note)
    }
}
