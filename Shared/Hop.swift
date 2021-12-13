//
//  Hop.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This specifies the types of data contained in each item

import SwiftUI
struct Hop : Codable, Identifiable {
    var id: String//required forname identifiable
    var name: String
    var volume: Float
    var weight: Float
    var alphaAcidContent: Float

    var boilTime: Int
    var imageName: String
}
