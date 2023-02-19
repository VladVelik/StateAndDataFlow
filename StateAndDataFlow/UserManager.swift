//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import Foundation

class UserManager: ObservableObject {
    @Published var user = User()
    var name = ""
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
