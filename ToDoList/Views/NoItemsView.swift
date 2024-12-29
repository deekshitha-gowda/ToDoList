import SwiftUI

struct NoItemView: View {

    @State var animated: Bool = false
    let secondaryColor = Color("SecondaryAccentColor")

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text(
                    "Are you a productive person? I think you should click the add button and ass a bunch of items to your todo list!"
                )
                .padding(.bottom, 30)

                NavigationLink(destination: AddView()) {
                    Text("Add Something")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.accentColor)
                        .background(animated ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animated ? 30 : 50)
                .shadow(
                    color: animated
                        ? secondaryColor.opacity(0.7)
                        : Color.accentColor.opacity(0.7),
                    radius: animated ? 30 : 10,
                    x: 0,
                    y: animated ? 50 : 30
                )
                .scaleEffect(animated ? 1.1 : 1.0)
                .offset(y: animated ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }

    func addAnimation() {
        print("first\(animated)")
        guard !animated else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animated.toggle()
                print("second\(animated)")

            }
        }
    }
}
#Preview {
    NavigationView {
        NoItemView()
            .navigationTitle("Title")
    }

}
