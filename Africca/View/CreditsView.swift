//
//  CreditsView.swift
//  Africca
//
//  Created by BJIT on 2021/06/02.
//

import SwiftUI

struct CreditsView: View {
    //MARK:-  Properties
    
    //MARK:- Body
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: .center)
            Text("""
                Copyright © Amit Chowdhury
                Allright reserved
                Less code😀
                """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//:VStack
        .padding()
        .opacity(0.4)
    }
}

//MARK:- Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
