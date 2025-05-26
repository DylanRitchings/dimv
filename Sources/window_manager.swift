import SwiftUI
import AppKit


struct ContentView: View {
    let images: [ String ]


    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            if let nsImage = NSImage(contentsOfFile: images[0]) {
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
        let contentView = ContentView(images: files)
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
