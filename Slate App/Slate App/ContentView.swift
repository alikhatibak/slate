//
//  ContentView.swift
//  Slate App
//
//  Created by Ali Khatib on 1/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Slate]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Slate created at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard)), Take: \(item.take), Scene: \(item.scene), Roll: \(item.roll), Director: \(item.director), DOP: \(item.dop), Slate: \(item.slate_identifier)")
                    } label: {
                        Text("\(item.production_title) Slate")
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Create a Slate", systemImage: "plus")
                    }
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Create a Project", systemImage: "minus")
                    }
                }
            }
        } detail: {
            Text("Create or Select a Slate")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Slate(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Slate.self, inMemory: true)
}
