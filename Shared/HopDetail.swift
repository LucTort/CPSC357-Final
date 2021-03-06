//
//  HopDetail.swift
//  CPSC357_Project_2
//
//  Created by cpsc on 10/28/21.
//

//This view is responsible for showing a specific item. It shows the image and text fields, and has a back button

import SwiftUI
//extension UIViewController {
struct HopDetail: View
{
    let selectedHop: Hop
    var body: some View
    {
        Form
        {
            Section(header: Text("Hop Details"))
            {
                Image(selectedHop.imageName)
                    .resizable()
                    .cornerRadius(12.0)
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text(selectedHop.name)
                    .font(.headline)
                
                //Formats and outpus the data on the specified hop
                VStack (alignment: .leading)
                {
                    Group //This group is here because Swift doesn't like having too many things in a VStack
                    {
                        //Conerting values to string to output
                        Text("Alpha Acid Content")
                            .font(.headline)
                        Text(String(format: "%f", selectedHop.alphaAcidContent))
                            .font(.body)
                        Spacer()
                        Text("Volume (gal)")
                            .font(.headline)
                        Text(String(format: "%f", selectedHop.volume))
                            .font(.body)
                        Spacer()
                    }//END Group
                    
                    Text("Weight (oz)")
                        .font(.headline)
                    Text(String(format: "%f", selectedHop.weight))
                        .font(.body)
                    Spacer()
                    Text("Boil Time (min)")
                        .font(.headline)
                    Text(String(selectedHop.boilTime))
                        .font(.body)
                    Spacer()
                    
                }//END VStack (alignment: .leading)
                
            }//END Section(header: Text("Hop Details"))
            
        }//END Form
        
    }//END  var body: some View
    
}//END struct HopDetail: View

//Creates structure for the preview to use
struct HopDetail_Previews: PreviewProvider
{
    static var previews: some View
    {
        HopDetail(selectedHop: hopData[0])
    }
}

//}
