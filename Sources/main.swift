// TODO create q to quit, get stdin, render images etc

import AppKit

let stdin = readLine(strippingNewline: true)!

let app = NSApplication.shared
app.setActivationPolicy(.regular)

let windowManager = WindowManager()
windowManager.createWindow(with: stdin)

DispatchQueue.main.async {
    NSApp.activate(ignoringOtherApps: true)
}

app.run()
