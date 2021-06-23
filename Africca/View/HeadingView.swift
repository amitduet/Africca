//
//  HeadingView.swift
//  Africca
//
//  Created by Amit on 2021/05/29.
//

import SwiftUI

struct HeadingView: View {
    //MARK:- Properties
    let headingImage:String
    let headingText:String
    //MARK:- Body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

//MARK:- Preview
struct HeadingView_Previews: PreviewProvider {
    
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wildness in Pictues")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
