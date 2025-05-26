import SwiftUI
import AppKit

// Subclassed window that handles "q" key to quit
class KeyWindow: NSWindow {
    override var canBecomeKey: Bool { true }
    override var canBecomeMain: Bool { true }

    override func keyDown(with event: NSEvent) {
        print("Pressed key: \(event.characters ?? "")")
        if let characters = event.characters, characters == "q" {
            NSApplication.shared.terminate(nil)
        }
    }
}

// SwiftUI view that displays the passed text
struct ContentView: View {
    let text: String

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text(text)
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}
