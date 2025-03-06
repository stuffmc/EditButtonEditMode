import SwiftUI

struct ContentView: View {
    @Environment(\.editMode) private var editMode
    @State private var navigationStack = false

    var body: some View {
        VStack {
            Toggle("Stack", isOn: $navigationStack)
                .frame(width: 100)
        }
        if navigationStack {
            // editMode doesn't get updated
            NavigationStack {
                // Also not when extracting it
                EditView()
            }
        } else {
            VStack {
                EditButton()
                Text(editMode.debugDescription)
                Spacer()
            }
        }
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
