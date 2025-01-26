import SwiftUI

struct ScreenshotView: View {
    var headerText: String
    var subtitleText: String
    var imageName: String // The name of an image added as an xcasset

    let maincolor: Color = .init(hex: 0x173C1C)
    let maincolortint2: Color = .init(hex: 0x456349)

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
    }
}

#Preview {
    ScreenshotView(headerText: "Manage your passes", subtitleText: "To edit later", imageName: "Screenshot1")
}
