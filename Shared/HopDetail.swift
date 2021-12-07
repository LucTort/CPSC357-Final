//
//  HopDetail.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This view is responsible for showing a specific item. It shows the image and text fields, and has a back button

import SwiftUI
//extension UIViewController {
struct HopDetail: View {
    let selectedHop: Hop
var body: some View {
    Form {
        Section(header: Text("Hop Details")) {
            Image(selectedHop.imageName)
                .resizable()
                .cornerRadius(12.0)
                .aspectRatio(contentMode: .fit)
                .padding()
            Text(selectedHop.name)
                .font(.headline)
            Text(selectedHop.description)
                .font(.body)
            VStack (alignment: .leading) {
                Text("Genre")
                    .font(.headline)
                Text(selectedHop.genre)
                    .font(.body)
                Spacer()
                Text("Platforms")
                    .font(.headline)
                Text(selectedHop.console)
                    .font(.body)
                Spacer()
                //if is hybrid, show this image
//                Image(systemName: selectedHop.isHybrid ?
//                      "checkmark.circle" : "xmark.circle" )
            }
        }
    }
}
}

//Creates structure for the preview to use
struct HopDetail_Previews: PreviewProvider {
    static var previews: some View {
        HopDetail(selectedHop: hopData[0])
    }
}

//}
