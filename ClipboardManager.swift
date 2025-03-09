import AppKit
import SwiftUI
import Combine

class ClipboardManager: ObservableObject {
    @Published var copiedTexts: [String] = [] {
        didSet {
            saveToLocal()
        }
    }
    private var timer: Timer?
    private let userDefaultsKey = "clipboardHistory"

    init() {
        loadFromLocal()
        startListening()
    }

    func startListening() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.checkClipboard()
        }
    }

    func checkClipboard() {
        if let clipboardString = NSPasteboard.general.string(forType: .string) {
            if !copiedTexts.contains(clipboardString) {
                DispatchQueue.main.async {
                    self.copiedTexts.insert(clipboardString, at: 0)
                }
            }
        }
    }

    func copyToClipboard(_ text: String) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
    }

    func saveToLocal() {
        UserDefaults.standard.setValue(copiedTexts, forKey: userDefaultsKey)
    }

    func loadFromLocal() {
        if let savedData = UserDefaults.standard.array(forKey: userDefaultsKey) as? [String] {
            self.copiedTexts = savedData
        }
    }

    func clearHistory() {
        copiedTexts.removeAll()
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }

    deinit {
        timer?.invalidate()
    }
}
