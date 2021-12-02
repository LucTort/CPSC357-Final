//
//  GameDetail.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This view is responsible for showing a specific item. It shows the image and text fields, and has a back button

import SwiftUI
//extension UIViewController {
struct GameDetail: View {
    let selectedGame: Game
var body: some View {
    Form {
        Section(header: Text("Game Details")) {
            Image(selectedGame.imageName)
                .resizable()
                .cornerRadius(12.0)
                .aspectRatio(contentMode: .fit)
                .padding()
                .foregroundColor(.red)
            Text(selectedGame.name)
                .font(.headline)
            Text(selectedGame.description)
                .font(.body)
            VStack (alignment: .leading) {
                Text("Genre")
                    .font(.headline)
                Text(selectedGame.genre)
                    .font(.body)
                Spacer()
                Text("Platforms")
                    .font(.headline)
                Text(selectedGame.console)
                    .font(.body)
                Spacer()
                //if is hybrid, show this image
//                Image(systemName: selectedGame.isHybrid ?
//                      "checkmark.circle" : "xmark.circle" )
            }
        }
    }
}
}

//Creates structure for the preview to use
struct GameDetail_Previews: PreviewProvider {
    static var previews: some View {
        GameDetail(selectedGame: gameData[0])
    }
}

//}
