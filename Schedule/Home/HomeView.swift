import SwiftUI

struct HomeView: View {
    @State var isLoading: Bool = false
    @State var schedule: [Classes] = []
    @State var pickerId: UUID = UUID()
    
    @StateObject var vm: ViewModel = ViewModel()
    
    @Binding var load: Bool
    
    var body: some View {
        VStack {
            DatePicker(
                "Date",
                selection: $vm.dateSelection,
                in: Date().advanced(by: -60*60*24*(vm.numberOfDayGettingEvents - 1))...Date().advanced(by: 60*60*24*(vm.numberOfDayGettingEvents - 1)),
                displayedComponents: [.date]
            ).disabled(isLoading)
                .id(pickerId)
                .onChange(of: vm.dateSelection) {
                    Task {
                        isLoading=true
                        pickerId=UUID()
                        await vm.loadEvents()
                        schedule = Schedule().getSchedule(schoolDay: vm.schoolDay)
                        isLoading=false
                    }
                }
            if (vm.isError) {
                Text(vm.errorMessage)
            } else {
                Text("\(vm.schoolDay.uppercased()) Day").bold().padding([.bottom], 20).font(.system(size: 35))
                Text(vm.dateSelection.formatted(date: .abbreviated, time: .omitted)).padding([.bottom], 50).font(.system(size: 25))
                Section() {
                    Grid(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
                        if (!isLoading) {
                            ForEach(schedule) { eachClass in
                                GridRow {
                                    Text(eachClass.name)
                                    Text(eachClass.room == "0" ? "IC" : eachClass.room)
                                }
                                Rectangle()
                                    .fill(.secondary)
                                    .frame(height: 1)
                            }
                        } else {
                            Text("Loading...")
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 80, height: 250)
                .padding(20)
                .background(Color.init(UIColor.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(50)
        .task {
            isLoading=true
            await vm.loadEvents()
            schedule = Schedule().getSchedule(schoolDay: vm.schoolDay)
            isLoading=false
        }
        .onChange(of: load) { _old, new in
            if (new) {
                Task {
                    isLoading=true
                    await vm.loadEvents()
                    schedule = Schedule().getSchedule(schoolDay: vm.schoolDay)
                    isLoading=false
                    load = false
                }
            }
        }
    }
}
