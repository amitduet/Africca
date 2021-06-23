//
//  Gallery.swift
//  Africca
//
//  Created by Amit on 2021/05/28.
//

import SwiftUI
/* Basic Grid
 1. Data
 2. Grid Item
 3. LazyVGrid and LazyHGrid
 **/

struct Gallery: View {
    //MARK:- Properties
    @State private var selectedAnimal:String = "lion"
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    //Simple Grid
    //    let gridlayout:[GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    //    //Efficient Grid
    //    let gridlayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    //Dynamic Grid Layout
    
    @State private var gridlayout:[GridItem] = [GridItem(.flexible())]
    
    @State private var gridColumn:Double = 3.0
    
    func gridSwitch(){
        gridlayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK:- Body
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            VStack (alignment:.center, spacing:40){
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                //MARK:- Slider
                Slider(value: $gridColumn, in: 2...4, step:1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                //MARK:- Grid
                LazyVGrid(columns: gridlayout, alignment: .center, spacing: 10, content: {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptic.impactOccurred()
                            }
                    }//:Loop
                }) //Grid View
                .animation(.easeIn)
                .onAppear(perform:{
                    gridSwitch()
                })
            }//:VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
            
        })//ScrollView
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

//MARK:- Preview
struct Gallery_Previews: PreviewProvider {
    static var previews: some View {
        Gallery()
    }
}
