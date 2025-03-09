//
//  ClipboardManagerApp.swift
//  ClipboardManager
//
//  Created by Adem Koçdoğan on 9.03.2025.
//

import SwiftUI

@main
struct ClipboardManagerApp: App {
    @StateObject private var clipboardManager = ClipboardManager()
    var body: some Scene {
        MenuBarExtra("Clipboard Manager", systemImage: "figure.climbing") {
            ContentView()
            
            Divider() 
                        
                        Button("Geçmişi Temizle") {
                            clipboardManager.clearHistory()
                        }

                        Divider()

                        Button("Çıkış Yap") {
                            NSApplication.shared.terminate(nil)
                        }
        }
        .menuBarExtraStyle(.window)
    }
}
