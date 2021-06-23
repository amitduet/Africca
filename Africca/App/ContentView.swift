//
//  ContentView.swift
//  Africca
//
//  Created by Amit on 2021/05/28.
//

import SwiftUI

struct ContentView: View {
    //MARK:- Properties
    let animals:[Animal] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive:Bool = false
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var gridLayout:[GridItem] = [ GridItem(.flexible()) ]
    
    @State private var gridColumn:Int = 1
    @State private var toolbarGridIcon = "square.grid.2x2"
    
    //MARK:- Functions
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        
        gridColumn = gridLayout.count
        
        switch  gridColumn{
        case 1:
            toolbarGridIcon = "square.grid.2x2"
            break
        case 2:
            toolbarGridIcon = "square.grid.3x2"
            break
        case 3:
            toolbarGridIcon = "rectangle.grid.1x2"
            break
        default:
            toolbarGridIcon = "square.grid.2x2"
        }
        
    }
    
    //MARK:- Body
    var body: some View {
        
        NavigationView {
            Group{
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height:300)
                            .listRowInsets(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                        
                        ForEach(animals){ animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListItemView(animal: animal)
                                })//Link
                        }//Loop
                        CreditsView()
                    }//List
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns:gridLayout, alignment:.center, spacing:10){
                            ForEach(animals){ animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    })//Link
                            }//Loop
                        } //Grid
                        .padding(10)
                        .animation(.easeIn)
                        CreditsView()
                            .modifier(CenterModifier() )
                        
                    }//ScrollView
                    
                }//: Condition
            }//:Group
            .navigationBarTitle("Africal", displayMode: .large)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    HStack(spacing:16) {
                        //List
                        Button(action: {
                            debugPrint("List View")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary:.accentColor)
                        })
                        
                        //Grid
                        Button(action: {
                            debugPrint("Grid Button Pressed")
                            isGridViewActive = true
                            gridSwitch()
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: toolbarGridIcon)
                                .font(.title)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        })
                        
                    }//:HStack
                }
            }//ToolBar
        }//:Navigation View
    }
}

//MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
