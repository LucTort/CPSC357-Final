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
    
    var body: some View
    {
        NavigationView
        {
           List
            {
                ForEach (hopStore.hops) { hop in
                    ListCell(hop: hop)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("Hops: "))
            .foregroundColor(.red)
            .navigationBarItems(leading: NavigationLink(destination:  AddNewHop(hopStore: self.hopStore)) {
                
                
                Text("Add")
                    .foregroundColor(.red)
            }, trailing: EditButton())
            .foregroundColor(.red)
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
//Shows a list of the games which can be selected
struct ListCell: View {
    var hop: Hop
    var body: some View {
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

//Basic content view structure
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



