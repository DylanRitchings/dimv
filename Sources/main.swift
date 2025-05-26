// TODO create q to quit, get stdin, render images etc

import AppKit

// let stdin = readLine(strippingnewline: true)!

var stdin = [String]()
while let line = readLine() {
    stdin.append(line)
}

let app = NSApplication.shared
app.setActivationPolicy(.regular)

let windowManager = WindowManager()
windowManager.createWindow(with: stdin)

DispatchQueue.main.async {
    NSApp.activate(ignoringOtherApps: true)
}

app.run()
