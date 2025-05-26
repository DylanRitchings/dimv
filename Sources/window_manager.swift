import SwiftUI
import AppKit

@MainActor
class WindowManager {
    private var window: KeyWindow?

    func createWindow(with text: String) {
        let contentView = ContentView(text: text)
        let hostingController = NSHostingController(rootView: contentView)
        let screenFrame = NSScreen.main!.frame

        window = KeyWindow(
            contentRect: screenFrame,
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )

        guard let window = window else { return }

        window.contentView = hostingController.view
        window.level = .mainMenu + 1
        window.makeKeyAndOrderFront(nil)
        window.center()
        window.isReleasedWhenClosed = false
        window.collectionBehavior = [.fullScreenPrimary, .canJoinAllSpaces]
        window.makeFirstResponder(window)
        NSApp.activate(ignoringOtherApps: true)
    }
}
