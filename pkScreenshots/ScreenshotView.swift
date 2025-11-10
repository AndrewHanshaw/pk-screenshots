import SwiftUI

private let FRAME_WIDTH = 1320
private let FRAME_HEIGHT = 2868

struct ScreenshotView: View {
    var headerText: String
    var subtitleText: String
    var imageName: String // The name of an image added as an xcasset

    let maincolor: Color = .init(hex: 0x146C20)
    let maincolortint2: Color = .init(hex: 0x42894C)

    var body: some View {
        ZStack {
            LinearGradient(colors: [maincolortint2, maincolor], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    Text(headerText)
                        .font(Font.system(size: 100))
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundStyle(Color.white)
                    Text(subtitleText)
                        .font(Font.system(size: 90))
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundStyle(Color.white)
                }
                Spacer()
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding([.leading, .trailing, .bottom], 50)
            }
            .padding()
        }
        .frame(width: CGFloat(FRAME_WIDTH), height: CGFloat(FRAME_HEIGHT))
    }
}

private let PREVIEW_SCALE = 0.25

#Preview {
    ScreenshotView(headerText: "Manage your Wallet", subtitleText: "With digital Passes", imageName: "Screenshot1")
        .scaleEffect(PREVIEW_SCALE)
        .frame(width: Double(FRAME_WIDTH) * PREVIEW_SCALE, height: Double(FRAME_HEIGHT) * PREVIEW_SCALE)
}
