//
//  ContentView.swift
//  ClipboardManager
//
//  Created by Adem Koçdoğan on 9.03.2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var clipboardManager = ClipboardManager()

    var body: some View {
        VStack {
            List {
                ForEach(clipboardManager.copiedTexts, id: \.self) { text in
                    HStack {
                        Text(text)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .padding(10)
                            .foregroundColor(.primary)

                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(nsColor: NSColor.windowBackgroundColor)))
                    .padding(.vertical, 4)
                    .contextMenu {
                        Button("Panoya Kopyala") {
                            clipboardManager.copyToClipboard(text)
                        }

                        Button("Sil") {
                            clipboardManager.copiedTexts.removeAll { $0 == text }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())

        }
        .frame(width: 350, height: 450)
        .onAppear {
            clipboardManager.startListening()
        }
    }
}

#Preview {
    ContentView()
}
