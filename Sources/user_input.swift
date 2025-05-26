import SwiftUI
import AppKit

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

