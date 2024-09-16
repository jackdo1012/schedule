import SwiftUI

struct MyScheduleView: View {
    let schedule: Schedule = Schedule()
    
    let days = ["a", "b", "c", "d", "e", "f", "g", "h"]
    
    var body: some View {
        List {
            ForEach(days, id: \.description) {day in
                Section {
                    Grid(alignment: .leading, horizontalSpacing: 10, verticalSpacing: 10) {
                        ForEach(schedule.getSchedule(schoolDay: day)) { eachClass in
                            GridRow {
                                Text(eachClass.name)
                                Text(eachClass.room == "0" ? "IC" : eachClass.room)
                            }
                            Rectangle()
                                .fill(.secondary)
                                .frame(height: 1)
                        }
                    }
                } header: {
                    Text("\(day.uppercased()) Day")
                }
            }
        }
    }
}

#Preview {
    MyScheduleView()
}
