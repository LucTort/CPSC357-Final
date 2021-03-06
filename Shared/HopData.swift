//
//  HopData.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This script is in charge of loading the item data


import UIKit
import SwiftUI
var hopData: [Hop] = loadJson("hopData.json")
func loadJson<T: Decodable>(_ filename: String) -> T
{
    let data: Data
    guard let file = Bundle.main.url(forResource: filename,
                                     withExtension: nil)
    else
    {
        fatalError("\(filename) not found.")
    }
    do
    {
        data = try Data(contentsOf: file)
    }
    catch
    {
        fatalError("Could not load \(filename): \(error)")
    }
    do
    {
        return try JSONDecoder().decode(T.self, from: data)
    }
    catch
    {
        fatalError("Unable to parse \(filename): \(error)")
    }
}
