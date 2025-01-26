import SwiftUI

struct GithubSocialPreview: View {
    let backgroundcolor1: Color = .init(hex: 0x173C1C)
    let backgroundcolor2: Color = .init(hex: 0x102A13)
    let textColor: Color = .init(hex: 0x88BD8F)

    var body: some View {
        ZStack {
            LinearGradient(colors: [backgroundcolor1, backgroundcolor2], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            HStack {
                Image("RoundedAppIcon")
                    .resizable()
                    .scaledToFit()
                    .padding(60)
                Spacer()
                Text("PassKeepr")
                    .font(.system(size: 200)) // Start with a very large font size
                    .lineLimit(1) // Ensure the text stays on one line
                    .minimumScaleFactor(0.1) // Allow scaling down to fit
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(textColor)
                    .shadow(radius: 5.0)
                    .padding(.trailing, 60)
            }
            .padding()
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    GithubSocialPreview()
}
