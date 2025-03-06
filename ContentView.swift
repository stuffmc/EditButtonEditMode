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
                Text(editMode.debugDescription)
                    .toolbar {
                        EditButton()
                    }
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

#Preview {
    ContentView()
}
