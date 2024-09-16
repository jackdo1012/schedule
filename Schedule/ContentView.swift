import SwiftUI

struct ContentView: View {
    @State private var load:Bool = false
    
    var body: some View {
        NavigationStack{
            HomeView(load: $load)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: MyScheduleView(), label: {
                        Image(systemName: "calendar")
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button() {
                        if (!load) {
                            load = true
                        }
                    } label: {
                        Image(systemName: "gobackward")
                    }
                    .disabled(load)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
