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
    @State private var name: String = "hop name"
    @State private var volumeStr: String = "1.0"
    @State private var volume: Float = 0.0
    @State private var weightStr: String = "1.0"
    @State private var weight: Float = 0.0
    @State private var alphaAcidContentStr: String = "2.0"
    @State private var alphaAcidContent: Float = 0.0
    @State private var boilTimeStr: String = "1"
    @State private var boilTime: Int = 0
    
    
    @State private var isEnabled: Bool = false;
    
    let formatter: NumberFormatter =
    {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()//END let formatter: NumberFormatter =
    
    var body: some View
    {
        Form
        {
            Section(header: Text("Hop Details"))
            {
                Image("hop2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Brew Volume (gal)", userInput: $volumeStr)
                DataInput(title: "Weight (oz)", userInput: $weightStr)
                DataInput(title: "Alpha Acid Content", userInput: $alphaAcidContentStr)
                DataInput(title: "Boil Time (min)", userInput: $boilTimeStr)
            }//END Section(header: Text("Hop Details"))
            
            Button(action: addNewHop)
            {
                Text("Add Hop")
                    
            }//END Button(action: addNewHop)
            //If there is no input, the button becomes disabled
            .disabled((self.name != "" &&
                       self.volumeStr != "" &&
                       (Float(self.volumeStr) ?? 0) >= 1.0 &&
                       (Float(self.volumeStr) ?? 0) <= 20.0 &&
                       self.weightStr != "" &&
                       (Float(self.weightStr) ?? 0) >= 0.01 &&
                       (Float(self.weightStr) ?? 0) <= 100.0 &&
                       self.alphaAcidContentStr != "") &&
                       (Float(self.alphaAcidContentStr) ?? 0) >= 2.0 &&
                       (Float(self.alphaAcidContentStr) ?? 0) <= 6.0 &&
                       self.boilTimeStr != "" &&
                       (Int(self.boilTimeStr) ?? 0) > 0 &&
                       (Int(self.boilTimeStr) ?? 0) <= 90 ? false : true)
    
            
        }//Form
        
    }//END var body: some View
    
    //Creates a new Hop object with the relevant data and adds it to the hopStore
    func addNewHop()
    {
        let newHop = Hop(id: UUID().uuidString,name: name, volume: Float(volumeStr) ?? 0, weight: Float(weightStr) ?? 0, alphaAcidContent: Float(alphaAcidContentStr) ?? 0, boilTime: Int(boilTimeStr) ?? 0, imageName: "hop2" )
        hopStore.hops.append(newHop)
    }//END func addNewHop()
}//END struct AddNewHop: View
    
//Creates a new preview to be shown by ContentView
struct AddNewHop_Previews: PreviewProvider
{
    static var previews: some View
    {
        AddNewHop(hopStore: HopStore(hops: hopData))
    }
}


//Provides a structure fo the user to input data relevant to the Hop object
struct DataInput: View
{
    var title: String
    @Binding var userInput: String
    var body: some View
    {
        VStack(alignment: HorizontalAlignment.leading)
        {
            Text(title)
                .font(.headline)
            TextField("Enter \(title)", text: $userInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }//END VStack(alignment: HorizontalAlignment.leading)
        .padding()
    }//END var body: some View
}//END struct DataInput: View
