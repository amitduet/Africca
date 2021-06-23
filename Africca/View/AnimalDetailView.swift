//
//  AnimalDetailView.swift
//  Africca
//
//  Created by Amit on 2021/05/29.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK:- Properties
    let animal:Animal
    
    //MARK:- Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment:.center, spacing:20) {
                //Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        // Color is view in SwiftUI
                        // Color can modifiy like other component
                        Color.accentColor
                            .frame(height:6)
                            .offset(y:8)
                    )
                //Head Line
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //Gallery
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildness in Pictues")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //Facts
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                //Description
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                }
                .padding(.horizontal)
                //Map
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn more")
                    ExternalWebView(animal: animal)
                    
                }.padding(.horizontal)
                
            }//:VStack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }//:Scrollview
        .padding(.vertical, 20)
    }
}

//MARK:- Preview
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
