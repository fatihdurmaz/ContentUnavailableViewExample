//
//  user.swift
//  ContentUnavailableViewExample
//
//  Created by Fatih Durmaz on 23.10.2023.
//


struct User: Codable, Identifiable {
    let id: Int
    let name, username, email: String
}
