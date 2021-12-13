//
//  HopStore.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

// This script manages the list of items in the app

import SwiftUI
import Combine
class HopStore : ObservableObject {
    @Published var hops: [Hop]
    @Published var totalIBU: Float
    @Published var totalHFU: Float
    @Published var totalHAU: Float
    
    
    init (hops: [Hop] = []) {
        self.hops = hops
        totalIBU = 0
        totalHFU = 0
        totalHAU = 0
    }
    
}
