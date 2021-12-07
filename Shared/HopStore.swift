//
//  HopStore.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This script manages the list of items in the app

import SwiftUI
import Combine
class HopStore : ObservableObject {
    @Published var hops: [Hop]
    init (hops: [Hop] = []) {
        self.hops = hops
    }
}
