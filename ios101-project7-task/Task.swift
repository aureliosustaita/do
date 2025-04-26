////
////  Task.swift
////
//
//import UIKit
//
//struct Task: Codable {
//    var title: String
//    var note: String?
//    var dueDate: Date
//    var isComplete: Bool = false {
//        didSet {
//            completedDate = isComplete ? Date() : nil
//        }
//    }
//    
//    private(set) var completedDate: Date?
//    private(set) var createdDate: Date = Date()
//    private(set) var id: String = UUID().uuidString
//}
//
//extension Task {
//    
//    private static let taskKey = "savedTasks"
//    
//    // 1. Save an array of tasks to UserDefaults
//    static func save(_ tasks: [Task]) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(tasks) {
//            UserDefaults.standard.set(encoded, forKey: taskKey)
//        }
//    }
//
//    // 2. Retrieve an array of saved tasks from UserDefaults
//    static func getTasks() -> [Task] {
//        guard let data = UserDefaults.standard.data(forKey: taskKey) else {
//            return []
//        }
//
//        let decoder = JSONDecoder()
//        if let tasks = try? decoder.decode([Task].self, from: data) {
//            return tasks
//        } else {
//            return []
//        }
//    }
//
//    // 3. Add a new task or update an existing task
//    func save() {
//        var tasks = Task.getTasks()
//
//        // Check if task already exists using ID
//        if let index = tasks.firstIndex(where: { $0.id == self.id }) {
//            // Remove old task
//            tasks.remove(at: index)
//            // Insert updated task at same index
//            tasks.insert(self, at: index)
//        } else {
//            // No match, just append
//            tasks.append(self)
//        }
//
//        // Save updated array
//        Task.save(tasks)
//    }
//}

// good one
import UIKit

struct Task: Codable {
    var title: String
    var isComplete: Bool = false {
        didSet {
            completedDate = isComplete ? Date() : nil
        }
    }

    private(set) var completedDate: Date?
    private(set) var createdDate: Date = Date()
    private(set) var id: String = UUID().uuidString
}

extension Task {
    private static let taskKey = "savedTasks"

    static func save(_ tasks: [Task]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: taskKey)
        }
    }

    static func getTasks() -> [Task] {
        guard let data = UserDefaults.standard.data(forKey: taskKey) else {
            return []
        }
        let decoder = JSONDecoder()
        return (try? decoder.decode([Task].self, from: data)) ?? []
    }

    func save() {
        var tasks = Task.getTasks()
        if let index = tasks.firstIndex(where: { $0.id == self.id }) {
            tasks.remove(at: index)
            tasks.insert(self, at: index)
        } else {
            tasks.append(self)
        }
        Task.save(tasks)
    }
}


//import UIKit
//
//struct Task: Codable {
//    var title: String
//    var createdDate: Date
//    var isComplete: Bool = false
//    var isHiddenFromTaskList: Bool = false
//    private(set) var id: String = UUID().uuidString
//}
//
//extension Task {
//    private static let taskKey = "savedTasks"
//
//    static func save(_ tasks: [Task]) {
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(tasks) {
//            UserDefaults.standard.set(encoded, forKey: taskKey)
//        }
//    }
//
//    static func getTasks() -> [Task] {
//        guard let data = UserDefaults.standard.data(forKey: taskKey) else {
//            return []
//        }
//        let decoder = JSONDecoder()
//        if let tasks = try? decoder.decode([Task].self, from: data) {
//            return tasks
//        } else {
//            return []
//        }
//    }
//
//    func save() {
//        var tasks = Task.getTasks()
//        if let index = tasks.firstIndex(where: { $0.id == self.id }) {
//            tasks[index] = self
//        } else {
//            tasks.append(self)
//        }
//        Task.save(tasks)
//    }
//}



