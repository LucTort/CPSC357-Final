//
//  ContentView.swift
//  Shared
//
//  Created by cpsc on 10/26/21.
//

//This is the view responsible for the main page of the app. It is in charge of managing the home screen and all the items it contains

import SwiftUI


struct ContentView: View {
    @StateObject private var gameStore : GameStore = GameStore(games: gameData)
    
    var body: some View
    {
        NavigationView
        {
           List
            {
                ForEach (gameStore.games) { game in
                    ListCell(game: game)
                }
                .onDelete(perform: deleteItems)
                .onMove(perform: moveItems)
            }
            .navigationBarTitle(Text("Video Games"))
            .foregroundColor(.red)
            .navigationBarItems(leading: NavigationLink(destination:  AddNewGame(gameStore: self.gameStore)) {
                
                
                Text("Add")
                    .foregroundColor(.red)
            }, trailing: EditButton())
            .foregroundColor(.red)
        }
    }
    func deleteItems(at offsets: IndexSet)
    {
        gameStore.games.remove(atOffsets: offsets)
    }

    func moveItems(from source: IndexSet, to destination: Int)
    {
        gameStore.games.move(fromOffsets: source, toOffset: destination)
    }
}




//SUBVIEW
//Shows a list of the games which can be selected
struct ListCell: View {
    var game: Game
    var body: some View {
        NavigationLink(destination: GameDetail(selectedGame: game)) {
            HStack {
                Image(game.imageName)
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width: 100, height: 60)
                Text(game.name)
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



