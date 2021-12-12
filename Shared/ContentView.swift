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
    
    var body: some View
    {
        if (isDoBrew)
        {
            VStack {
                //Display hop data
                ForEach (hopStore.hops) { hop in
                    ListVal(hop: hop)
                }
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
                    Wart(isDoBrew: $isDoBrew)
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
//            NavigationLink(destination: HopDetail(selectedHop: hop)) {
//                HStack {
//                    Image(hop.imageName)
//                        .resizable()
//                        .aspectRatio(contentMode:.fit)
//                        .frame(width: 100, height: 60)
//                    Text(hop.name)
//                }
//            }
        }
    }
}

struct Wart: View {
    @State private var sweetWartContentStr: String = "0.0"
    @Binding var isDoBrew: Bool
    var body: some View{
        DataInput(title: "Sweet Wart Content", userInput: $sweetWartContentStr)
        
        Spacer()
        
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
        Spacer()
    }
}

//Basic content view structure
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//Original view. This has since been moved into the main view to simplify things

////https://stackoverflow.com/questions/56797333/swiftui-change-view-with-button
//struct AppHome: View {
//    @Binding var isDoBrew: Bool
//
//    var body: some View {
//        VStack {
//        Text("wOW")
//            Button(action: {
//                self.isDoBrew = !self.isDoBrew
//            }) {
//                Text("Go Back")
//                    .padding(10.0)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10.0)
//                            .stroke(lineWidth: 2.0)
//                    )
//            }
//            Spacer()
//        }
//    }
//}


