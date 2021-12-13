//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 10/26/21.
//

//This is the view responsible for the main page of the app. It is in charge of managing the home screen and all the items it contains

import SwiftUI


struct ContentView: View {
    @StateObject private var hopStore : HopStore = HopStore(hops: hopData)
    @State var isDoBrew: Bool = false
    @State private var sweetWartContentStr: String = "0.0"
    
    var body: some View
    {
        if (isDoBrew)
        {
            VStack {
                //Display hop data
                
                Text("Brew Report") // fix display fonts
                    .font(.largeTitle)
                    .bold()
                
                Text("Total IBU: \(calculateTotalIBU(hopStore: hopStore, sweetWart: Float(sweetWartContentStr) ?? 0))")
                Text("Hop Aroma Units: \(hopStore.totalHAU)")
                Text("Hop Flavor Units: \(hopStore.totalHFU)")
                
                //End display hop data
                Button(action: {
                    self.isDoBrew = !self.isDoBrew
                }) {
                    Text("Go Back")
                        .padding(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
            }
        }
        else
        {
            NavigationView
            {
                VStack{
                   List
                    {
                        ForEach (hopStore.hops) { hop in
                            ListCell(hop: hop)
                        }
                        .onDelete(perform: deleteItems)
                        .onMove(perform: moveItems)
                    }
                    .navigationBarTitle(Text("Hops"))
                    .navigationBarItems(leading: NavigationLink(destination:  AddNewHop(hopStore: self.hopStore)) {
                        
                        
                        Text("Add")
                    }, trailing: EditButton())
                    DataInput(title: "Sweet Wart Content", userInput: $sweetWartContentStr)
                    
                    //https://www.simpleswiftguide.com/how-to-create-button-in-swiftui/
                    Button(action: {
                        self.isDoBrew = !self.isDoBrew
                    }) {
                        Text("Do the Brew")
                            .padding(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 2.0)
                            )
                    }
                    
                    }
            }
        }
    }
    func deleteItems(at offsets: IndexSet)
    {
        hopStore.hops.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int)
    {
        hopStore.hops.move(fromOffsets: source, toOffset: destination)
    }
    
    
    
    //     ____        __              __     ______      __           __      __  _
    //    / __ \__  __/ /_____  __  __/ /_   / ____/___ _/ /______  __/ /___ _/ /_(_)___  ____  _____
    //   / / / / / / / __/ __ \/ / / / __/  / /   / __ `/ / ___/ / / / / __ `/ __/ / __ \/ __ \/ ___/
    //  / /_/ / /_/ / /_/ /_/ / /_/ / /_   / /___/ /_/ / / /__/ /_/ / / /_/ / /_/ / /_/ / / / (__  )
    //  \____/\__,_/\__/ .___/\__,_/\__/   \____/\__,_/_/\___/\__,_/_/\__,_/\__/_/\____/_/ /_/____/
    //                /_/
    func calculateTotalIBU(hopStore: HopStore, sweetWart: Float )->Float{
        var sumIBU: Float = 0.0
        
        for hop in hopStore.hops{
            
            //IBU calculation variables
            let e: Float = 2.71828
            let sweetWart: Float = 1.05
            let BF: Float = (1.65 * pow(0.000125, (sweetWart-1)))
            let BTF: Float = ( (1.0 - pow(e, -0.04 * Float(hop.boilTime)) )/4.15)
            let AAU: Float = BF * BTF
            let AAAPV: Float = ((hop.alphaAcidContent * hop.weight * 7490) / hop.volume)
            
            sumIBU += AAU * AAAPV
        }
        return sumIBU;
    }
    
    
}




//SUBVIEW
//Shows a list of the hops which can be selected
struct ListCell: View {
    var hop: Hop
    var body: some View {
        VStack{
            NavigationLink(destination: HopDetail(selectedHop: hop)) {
                HStack {
                    Image(hop.imageName)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: 100, height: 60)
                    Text(hop.name)
                }
            }
        }
    }
}
struct ListVal: View {
    var hop: Hop
    var body: some View {
        VStack{
            Text("Hop weight \(hop.weight)")
        }
    }
}

struct Wart: View {
    @State private var sweetWartContentStr: String = "0.0"
    @Binding var isDoBrew: Bool
    var body: some View{
        DataInput(title: "Sweet Wart Content", userInput: $sweetWartContentStr)
    }
}

//Basic content view structure
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



