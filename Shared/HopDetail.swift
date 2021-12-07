//
//  HopDetail.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This view is responsible for showing a specific item. It shows the image and text fields, and has a back button

import SwiftUI
//extension UIViewController {

// change this struct to include 
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
                .foregroundColor(.red)
            Text(selectedHop.name)
                .font(.headline)
            Text(selectedHop.weight)
                .font(.body)
            VStack (alignment: .leading) {
                Text("Genre")
                    .font(.headline)
                Text(selectedHop.alphaAcidContent)
                    .font(.body)
                Spacer()
                Text("Platforms")
                    .font(.headline)
                Text(selectedHop.postBoilVol)
                    .font(.body)
                Spacer()
                Text(selectedHop.boilTime)
                    .font(.body)
            
                Spacer()

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
