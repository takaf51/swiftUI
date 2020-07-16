import SwiftUI

struct StateView: View {
    @State var isOn:Bool = false
    var body: some View {
        RecordingStateView(isOn: $isOn) {
            HStack{
                Image(systemName: "waveform.circle")
                    .font(.system(size: 30))
                    .foregroundColor(.red)
                Text("Recording Status")
            }
            Text("Tap the icon to record")
                .font(.caption)
        }
        .onTapGesture {
            self.isOn.toggle()
        }
    }
}


struct RecordingStateView<Content: View>: View {
    var isOn:Binding<Bool>
    let label:() -> Content
    var body: some View {
        VStack {
            if isOn.wrappedValue {
                Image(systemName: "mic.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.red)
            }
            else {
                Image(systemName: "mic.slash.fill")
                    .font(.system(size: 100))
            }
            label()
        }
    }
    init(isOn: Binding<Bool>, @ViewBuilder label:@escaping () -> Content){
        self.label = label
        self.isOn = isOn
    }
}
