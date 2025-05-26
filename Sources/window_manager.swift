import SwiftUI
import AppKit


struct ContentView: View {
    let text: String

    let imagePath = "/Users/dylan/Pictures/import/4/DSCF3897.JPG"

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            if let nsImage = NSImage(contentsOfFile: imagePath) {
                Image(nsImage: nsImage)
                    .resizable()
                    .scaledToFit()
            } else {
                Text("Failed to load image")
                    .foregroundColor(.white)
            }
        }
    }

}

@MainActor
class WindowManager {
    private var window: KeyWindow?
    
    func createWindow(with files: [String]) {
        let contentView = ContentView(text: files.joined(separator: ", "))
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
