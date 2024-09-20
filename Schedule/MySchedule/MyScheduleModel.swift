import Foundation

struct Classes: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var room: String
    init(name: String, room: String) {
        self.name = name
        self.room = room
    }
}

struct Schedule {
    func getSchedule(schoolDay: String) -> [Classes] {
        switch schoolDay {
        case "a":
            return self.a
        case "b":
            return self.b
        case "c":
            return self.c
        case "d":
            return self.d
        case "e":
            return self.e
        case "f":
            return self.f
        case "g":
            return self.g
        case "h":
            return self.h
        case "no_school":
            return self.no_school
        default:
            return self.no_school
        }
    }
    private let a = [
        Classes(name: "HR", room: "225"),
        Classes(name: "Robotics", room: "135"),
        Classes(name: "US Hist", room: "133"),
        Classes(name: "Physics", room: "132"),
        Classes(name: "American Lit", room: "124"),
        Classes(name: "Study Hall", room: "0"),
    ]
    private let b = [
        Classes(name: "HR", room: "225"),
        Classes(name: "Pre calc", room: "214"),
        Classes(name: "Engineering", room: "135"),
        Classes(name: "Religion", room: "0"),
        Classes(name: "Robotics", room: "135"),
        Classes(name: "US Hist", room: "133"),
    ]
    private let c = [
        Classes(name: "HR", room: "225"),
        Classes(name: "Physics", room: "132"),
        Classes(name: "American Lit", room: "124"),
        Classes(name: "Study Hall", room: "0"),
        Classes(name: "Pre calc", room: "214"),
        Classes(name: "Engineering", room: "135"),
    ]
    private let d = [
        Classes(name: "HR", room: "225"),
        Classes(name: "Religion", room: "0"),
        Classes(name: "Robotics", room: "135"),
        Classes(name: "US Hist", room: "133"),
        Classes(name: "Physics", room: "132"),
        Classes(name: "American Lit", room: "124"),
    ]
    private let e = [
        Classes(name: "HR", room: "225"),
        Classes(name: "Study Hall", room: "0"),
        Classes(name: "Pre calc", room: "214"),
        Classes(name: "Engineering", room: "135"),
        Classes(name: "Religion", room: "0"),
        Classes(name: "Robotics", room: "135"),
    ]
    private let f = [
        Classes(name: "HR", room: "225"),
        Classes(name: "US Hist", room: "133"),
        Classes(name: "Physics", room: "132"),
        Classes(name: "American Lit", room: "124"),
        Classes(name: "Study Hall", room: "0"),
        Classes(name: "Pre calc", room: "214"),
    ]
    private let g = [
        Classes(name: "HR", room: "225"),
        Classes(name: "Engineering", room: "135"),
        Classes(name: "Religion", room: "0"),
        Classes(name: "Robotics", room: "135"),
        Classes(name: "US Hist", room: "133"),
        Classes(name: "Physics", room: "132"),
    ]
    private let h = [
        Classes(name: "HR", room: "225"),
        Classes(name: "American Lit", room: "124"),
        Classes(name: "Study Hall", room: "0"),
        Classes(name: "Pre calc", room: "214"),
        Classes(name: "Engineering", room: "135"),
        Classes(name: "Religion", room: "0"),
    ]
    private let no_school = [
        Classes(name:"No class", room: "-"),
        Classes(name:"No class", room: "-"),
        Classes(name:"No class", room: "-"),
        Classes(name:"No class", room: "-"),
        Classes(name:"No class", room: "-"),
        Classes(name:"No class", room: "-")
    ]
}
