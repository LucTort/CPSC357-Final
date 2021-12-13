//
//  AddHopView.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This is the script which specifies the view for adding a new hop. It has a bunch of text fields which can be filled out, as well as a button at the bottom for adding the item, and a back button

import SwiftUI
struct AddNewHop: View
{
    @StateObject var hopStore : HopStore
    @State private var name: String = ""
    @State private var volumeStr: String = "0.0"
    @State private var volume: Float = 0.0
    @State private var weightStr: String = "0.0"
    @State private var weight: Float = 0.0
    @State private var alphaAcidContentStr: String = "2"
    @State private var alphaAcidContent: Float = 0.0
    @State private var boilTimeStr: String = "Boil tyme"
    @State private var boilTime: Int = 0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        Form {
            Section(header: Text("Hop Details")) {
                Image("340px-Hop-Boy-FL")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Brew Volume", userInput: $volumeStr)
                DataInput(title: "Weight", userInput: $weightStr)
                DataInput(title: "Alpha Acid Content", userInput: $alphaAcidContentStr)
                DataInput(title: "Boil Time", userInput: $boilTimeStr)
            }
            Button(action: addNewHop) {
                Text("Add Hop")
            
            }
            
        }
        
    }
    
    //Creates a new Hop object with the relevant data and adds it to the hopStore
    func addNewHop() {
        let newHop = Hop(id: UUID().uuidString,
                         name: name, volume: Float(volumeStr) ?? 0, weight: Float(weightStr) ?? 0, alphaAcidContent: Float(alphaAcidContentStr) ?? 0, boilTime: Int(boilTimeStr) ?? 0, imageName: "340px-Hop-Boy-FL" )
        hopStore.hops.append(newHop)
        hopStore.totalIBU += 1
//        ContentView()
        }
    }
    
//Creates a new preview to be shown by ContentView
struct AddNewHop_Previews: PreviewProvider {
    static var previews: some View
    {
        AddNewHop(hopStore: HopStore(hops: hopData))
    }
}


//Provides a structure fo the user to input data relevant to the Hop object
struct DataInput: View {
    var title: String
    @Binding var userInput: String
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}
