//
//  MainView.swift
//  Africca
//
//  Created by Amit on 2021/05/28.
//

import SwiftUI

struct MainView: View {
    //MARK:- Properties
    
    //MARK:- Body
    var body: some View {
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Location")
                }
            Gallery()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
        }//TabView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
