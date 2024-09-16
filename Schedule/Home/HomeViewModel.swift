import SwiftUI

extension HomeView {
    @MainActor
    class ViewModel: ObservableObject {
        private var events: [SchoolEvents] = []
        public let numberOfDayGettingEvents: Double = 15

        @Published var dateSelection: Date
        @Published private(set) var schoolDay: String
        @Published var isError: Bool = false
        @Published var errorMessage: String = ""
        
        init()  {
            self.dateSelection = Date()
            self.schoolDay = "no_school"
        }
        
        private func dateFormatter(date: Date) -> String {
            let dateStyle = DateFormatter()
            dateStyle.dateFormat = "yyyy-MM-dd"
            let result = dateStyle.string(from: date)
            return result
        }
        public func loadEvents() async {
            do {
                let now = Date()
                let url = URL(string: "https://thrillshare-cmsv2.services.thrillshare.com/api/v4/o/13360/cms/events?paginate=false&start_date=\(dateFormatter(date: now.advanced(by: -60*60*24*numberOfDayGettingEvents)))&end_date=\(dateFormatter(date: now.advanced(by: 60*60*24*numberOfDayGettingEvents)))")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(APIRes.self, from: data)
                var events = response.events
                let currentDateFormatter = DateFormatter()
                currentDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                events = events.filter{dateFormatter(date: currentDateFormatter.date(from: $0.formatted_start)!) == dateFormatter(date: dateSelection) && ["A Day", "B Day", "C Day", "D Day", "E Day", "F Day", "G Day", "H Day"].contains($0.title.trimmingCharacters(in: .whitespacesAndNewlines))}
                if (events.count > 0) {
                    schoolDay = events[0].title.first?.description.lowercased() ?? "no_school"
                } else {
                    schoolDay = "no_school"
                }
            } catch {
                isError = true
                errorMessage = error.localizedDescription
            }
        }
    }
}
