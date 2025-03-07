import SwiftUI

struct ContentView: View {
    @Environment(\.editMode) private var editMode
    @State private var navigationStack = false
    @State private var container = false

    var body: some View {
        VStack {
            HStack(spacing: 50) {
                Toggle("Navigation", isOn: $navigationStack)
                    .frame(width: 150)
                if navigationStack {
                    Toggle("Container", isOn: $container)
                } else {
                    Spacer()
                }
            }
            .frame(alignment: .leading)
            if navigationStack {
                // editMode doesn't get updated, unless...
                NavigationStack {
                    // It's crazy: H/V/Zstack needed. Group won't work.
                    if container {
                        VStack {
                            EditView()
                                .background(Color.green)
                        } // Will work (because of V
                    } else {
                        EditView() // Will not
                            .background(Color.red)
                    }
                }
            } else {
                VStack {
                    EditButton()
                    Text(editMode.debugDescription)  // Will work
                    Spacer()
                }
                .background(Color.green)
            }
        }.padding()
    }
}

struct EditView: View {
    @Environment(\.editMode) private var editMode

    var body: some View {
        Text(editMode.debugDescription)
            .toolbar {
                EditButton()
            }
    }
}

#Preview {
    ContentView()
}
