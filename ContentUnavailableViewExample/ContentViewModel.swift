//
//  ContentViewModel.swift
//  ContentUnavailableViewExample
//
//  Created by Fatih Durmaz on 23.10.2023.
//

import Foundation
import Alamofire

class ContentViewModel: ObservableObject {
    
    @Published var users : [User] = []
    @Published var searchText:String = ""
    
    func fetchUsers() {
        AF.request("https://jsonplaceholder.typicode.com/users")
            .responseDecodable(of: [User].self) { response in
                switch response.result {
                case .success(let users):
                    self.users = users
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
    }
    
    var filteredUsers: [User] {
        guard !searchText.isEmpty else { return self.users }
        
        return users.filter { user in
            user.name.lowercased().contains(searchText.lowercased())
        }
    }
}
