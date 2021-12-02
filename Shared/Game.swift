//
//  Game.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This specifies the types of data contained in each item

import SwiftUI
struct Game : Codable, Identifiable {
var id: String
var name: String
var description: String
var genre: String
var console: String
var imageName: String
}
