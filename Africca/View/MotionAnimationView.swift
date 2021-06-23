//
//  MotionAnimationView.swift
//  Africca
//
//  Created by Amit on 2021/05/31.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK:- Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating:Bool = false
    //MARK:- Funtions
    
    // Random Coordinate
    
    func randomCoordinate(max:CGFloat) ->CGFloat{
        
        return CGFloat.random(in: 0.0...max)
    }
    // Random Size
    
    func randomSize() ->CGFloat {
        
        return CGFloat.random(in: 10...300)
    }
    // Random Scale
    
    func randScale() ->CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // Random Speed
    func randomSpeed()->Double{
        return Double.random(in: 0.025...1.0)
    }
    // Random Dealy
    func randomDeally()->Double{
        return Double.random(in: 0.0...2.0)
    }
    
    //MARK:- Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id:\.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randScale():1)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDeally())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//Foreach
                
                //                Text("Size Width:\(Int(geometry.size.width))  Height:\(Int(geometry.size.height))")
            }//:ZStack
            .drawingGroup()
        }//:Geometry
    }
}

//MARK:- Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView().previewDevice("iPhone X")
    }
}
