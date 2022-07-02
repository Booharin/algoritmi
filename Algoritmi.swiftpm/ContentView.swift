import SwiftUI

struct ContentView: View {
    private var viewModel: ContentViewViewModelProtocol

    init(viewModel: ContentViewViewModelProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
    }
}
