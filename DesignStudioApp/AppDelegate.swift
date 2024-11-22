//
//  AppDelegate.swift
//  DesignStudioApp
//
//  Created by Suleman Abrar on 17/11/2024.
//

import SwiftUI
import AppKit

@available(macOS 13.0, *)
class AppDelegate: NSObject, NSApplicationDelegate {
    var loadingWindow: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create a new NSWindow for the loading screen
        let loadingWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 400, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )

        // Create a NSHostingController to host the SwiftUI loading screen
        let loadingViewController = NSHostingController(rootView: LoadingScreenView())

        // Set the content view controller of the loading window
        loadingWindow.contentViewController = loadingViewController

        // Make the loading window visible
        loadingWindow.makeKeyAndOrderFront(nil)

        // ... Your app's initialization logic ...

        // Once your main SwiftUI view is ready, hide the loading screen
        loadingWindow.close()
    }
}
