import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Save screenshot 1") {
            saveViewAsPNG(view: ScreenshotView(headerText: "Manage your Wallet", subtitleText: "With digital Passes", imageName: "Screenshot1"), filename: "Screenshot1")
        }
        .padding()

        Button("Save screenshot 2") {
            saveViewAsPNG(view: ScreenshotView(headerText: "Customize Passes", subtitleText: "To create unique cards", imageName: "Screenshot2"), filename: "Screenshot2")
        }
        .padding()

        Button("Save screenshot 3") {
            saveViewAsPNG(view: ScreenshotView(headerText: "Scan existing cards", subtitleText: "And save them digitally", imageName: "Screenshot3"), filename: "Screenshot3")
        }
        .padding()

        Button("Save GitHub Social Preview") {
            saveViewAsPNG(view: GithubSocialPreview(), filename: "GitHubSocialPreview")
        }
        .padding()
    }

    func saveViewAsPNG<V: View>(view: V, filename: String) {
        let renderer = ImageRenderer(content: view)

        if let image = renderer.cgImage {
            let bitmapRep = NSBitmapImageRep(cgImage: image)
            if let pngData = bitmapRep.representation(using: .png, properties: [:]) {
                let savePanel = NSSavePanel()
                savePanel.title = "Save PNG"
                savePanel.allowedContentTypes = [.png]
                savePanel.nameFieldStringValue = filename

                savePanel.begin { result in
                    if result == .OK, let saveURL = savePanel.url {
                        do {
                            try pngData.write(to: saveURL)
                            print("View saved as PNG at \(saveURL)")
                        } catch {
                            print("Failed to save PNG: \(error)")
                        }
                    }
                }
            } else {
                print("Failed to create PNG data.")
            }
        } else {
            print("Failed to render view as image.")
        }
    }
}

#Preview {
    ContentView()
}
