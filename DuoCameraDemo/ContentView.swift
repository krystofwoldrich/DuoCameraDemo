import SwiftUI

struct ContentView: View {
    @State private var camera = CameraModel()
    @State private var isOuterDisplayEnabled = true
    @State private var isOuterDisplayAvailable = false

    var body: some View {
        ZStack(alignment: .bottom) {
            CameraPreview(session: camera.session)
                .ignoresSafeArea()

            VStack(spacing: 12) {
                Text(isOuterDisplayAvailable ? "Outer display: available" : "Outer display: unavailable")
                    .font(.headline)
                Toggle("Show on outer display", isOn: $isOuterDisplayEnabled)
                    .disabled(!isOuterDisplayAvailable)
            }
            .padding()
            .background(.regularMaterial, in: .rect(cornerRadius: 16))
            .padding()
        }
        // The system shows this content on the outer display while the app is
        // full screen on the inner display and has an active camera session.
        .sceneAccessory {
            CameraCaptureAccessory(isEnabled: $isOuterDisplayEnabled) {
                OuterDisplayView()
            }
            .onAvailabilityChange { isAvailable in
                isOuterDisplayAvailable = isAvailable
            }
        }
        .task {
            await camera.start()
        }
    }
}

struct OuterDisplayView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .orange], startPoint: .top, endPoint: .bottom)
            VStack(spacing: 16) {
                Image(systemName: "face.smiling")
                    .font(.system(size: 120))
                Text("Smile!")
                    .font(.system(size: 56, weight: .bold, design: .rounded))
            }
            .foregroundStyle(.white)
        }
        .ignoresSafeArea()
    }
}
