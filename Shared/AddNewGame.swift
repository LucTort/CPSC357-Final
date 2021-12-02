//
//  AddGameView.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This is the script which specifies the view for adding a new game. It has a bunch of text fields which can be filled out, as well as a button at the bottom for adding the item, and a back button

import SwiftUI
struct AddNewGame: View
{
    @StateObject var gameStore : GameStore
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var genre: String = ""
    @State private var console: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Game Details")) {
                Image("340px-Game-Boy-FL")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                DataInput(title: "Genre", userInput: $genre)
                DataInput(title: "Console", userInput: $console)
//                {
////                Toggle(isOn: $isHybrid)
//
//                    Text("Hybrid").font(.headline)
//                }.padding()
            }
            Button(action: addNewGame) {
                Text("Add Game")
                    .foregroundColor(.red)
            
            }
            
        }
        
    }
    
    //Creates a new Game object with the relevant data and adds it to the gameStore
    func addNewGame() {
        let newGame = Game(id: UUID().uuidString,
                         name: name, description: description, genre: genre, console: console, imageName: "340px-Game-Boy-FL" )
        gameStore.games.append(newGame)
//        ContentView()
        }
    }
    
//Creates a new preview to be shown by ContentView
struct AddNewGame_Previews: PreviewProvider {
    static var previews: some View
    {
        AddNewGame(gameStore: GameStore(games: gameData))
    }
}


//Provides a structure fo the user to input data relevant to the Game object
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
