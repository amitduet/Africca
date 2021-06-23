//
//  InsetGalleryView.swift
//  Africca
//
//  Created by Amit on 2021/05/29.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK:- Properties
    let animal:Animal
    
    /*
     animal.gallery - string list
     there is no id
     that's why we used id like this way
     **/
    //MARK:- Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (alignment:.center, spacing:15){
                ForEach(animal.gallery, id:\.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height:200.0)
                        .cornerRadius(20.0)
                }//:Loop
            }//:HStack
        }//:ScrollView
    }
}

//MARK:- Preview
struct InsetGalleryView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals[0]).previewLayout(.sizeThatFits)
            .padding()
    }
}
