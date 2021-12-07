//
//  AddHopView.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This is the script which specifies the view for adding a new hop. It has a bunch of text fields which can be filled out, as well as a button at the bottom for adding the item, and a back button

import SwiftUI

// change this struct to hops member variables
struct AddNewHop: View
{
    
    @StateObject var hopStore : HopStore
    @State public var name: String = ""
    @State public var weight: Double = 0.0;
    @State public var alphaAcidContent: Double
    @State public var postBoilVol: Double
    @State public var boilTime: Int
    
    var body: some View {
        Form {
            Section(header: Text("Hop Details")) {
                Image("340px-Hop-Boy-FL")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
//                DataInput(title: "Weight", userInput: $weight)
//                DataInput(title: "Alpha Acid Content", userInput: $alphaAcidContent)
//                DataInput(title: "Post Boil Volumne", userInput: $postBoilVol)
//                DataInput(title:"Boil Time", userInput: $boilTime)
                
//                {
////                Toggle(isOn: $isHybrid)
//
//                    Text("Hybrid").font(.headline)
//                }.padding()
            }
            Button(action: addNewHop) {
                Text("Add Hop")
                    .foregroundColor(.red)
            
            }
            
        }
        
    }
    
    //Creates a new Hop object with the relevant data and adds it to the hopStore
    func addNewHop() {
        let newHop = Hop(id: UUID().uuidString,
                         name: name, description: description, genre: genre, console: console, imageName: "340px-Hop-Boy-FL" )
        hopStore.hops.append(newHop)
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
