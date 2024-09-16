import Foundation

struct APIRes: Codable {
    let events: [SchoolEvents]
}

struct SchoolEvents: Codable {
    let id: Int
    let title: String
    let venue: String
    let address: String
    let city_state: String
    let state: String
    let zip: String
    let description: String
    let start_at: String
    let end_at: String
    let all_day: Bool
    let start: String
    let end: String
    let day: String
    let month: String
    let year: String
    let time: String
    let filter_name: [String]
    let filter_color: [String]
    let formatted_date: String
    let cms_formatted_date: String
    let formatted_start: String
    let formatted_end: String
    let latitude: String
    let longitude: String
    let custom_section_id: Int
    let recurrent: Bool
    let custom_section_name: String
}

