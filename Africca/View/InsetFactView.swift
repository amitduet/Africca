//
//  InsetFactView.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import SwiftUI

struct InsetFactView: View {
    //MARK:- Properties
    let animal:Animal
    
    
    //MARK:- Body
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//:GropBox
    }
}

//MARK:- Body
struct InsetFactView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals[0]).previewLayout(.sizeThatFits)
            .padding()
    }
}
