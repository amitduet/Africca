//
//  ExternalWebView.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import SwiftUI

struct ExternalWebView: View {
    //MARK:- Properties
    let animal:Animal
    
    //MARK:- Body
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https.wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }//:HStack
        }//GroupBox
    }
}

//MARK:- Preview
struct ExternalWebView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
