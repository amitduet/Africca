//
//  CoverImageView.swift
//  Africca
//
//  Created by Amit on 2021/05/28.
//

import SwiftUI

struct CoverImageView: View {
    //MARK:- Properties
    let coverImages:[CoverImage] = Bundle.main.decode("covers.json")
    //MARK:- Body
    var body: some View {
        TabView {
            ForEach(coverImages) { cover in
                Image(cover.name)
                    .resizable()
                    .scaledToFill()
            } // Loop
        }//:TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

//MARK:- Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView().previewLayout(.fixed(width: 400, height: 300))
    }
}
