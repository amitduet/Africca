//
//  MapAnnotationView.swift
//  Africca
//
//  Created by Amit on 2021/05/31.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK:- Properties
    var loccation:NationalParkLocation
    @State private var animation:Double = 0.0
    
    //MARK:- Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1.0+CGFloat(animation))
                .opacity(1-animation)
            
            
            Image(loccation.image)
                .resizable()
                .frame(width: 48, height: 48, alignment: .center)
                .scaledToFit()
                .clipShape(Circle())
        }//:ZStack
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2.0).repeatForever(autoreverses: false)){
                animation = 1.0
            }
        }
    }
}

//MARK:- Preview
struct MapAnnotationView_Previews: PreviewProvider {
    static var locations:[NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(loccation: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
