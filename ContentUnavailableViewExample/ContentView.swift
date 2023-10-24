//
//  ContentView.swift
//  ContentUnavailableViewExample
//
//  Created by Fatih Durmaz on 23.10.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.filteredUsers) { item in
                    HStack {
                        Text("\(item.id)")
                            .font(.title2)
                            .padding()
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(.circle)
                        
                        VStack (alignment: .leading) {
                            Text(item.name)
                                .bold()
                            Text(item.email)
                        }
                    }
                }
            }
            .onAppear{
                viewModel.fetchUsers()
            }
            .searchable(text: $viewModel.searchText)
            .overlay {
                if viewModel.filteredUsers.isEmpty {
                    ContentUnavailableView.search(text: viewModel.searchText)
                    /*
                    ContentUnavailableView{
                        Label("No Results", systemImage: "tray.fill")
                            .bold()
                            .foregroundStyle(.red)
                    } description: {
                        Text("Not found search")
                    }
                     */
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    ContentView()
}
