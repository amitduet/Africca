//
//  VideoPlayerView.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK:- Properties
    let video:Video
    
    //MARK:- Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVidew(fileName: video.id, fileFormat: "mp4")){
                //Text(video.name)
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                ,alignment: .topLeading
            )
        }//:VStack
        .foregroundColor(.accentColor)
        .navigationBarTitle(video.name, displayMode: .inline)
    }
}

//MARK:- Preview
struct VideoPlayerView_Previews: PreviewProvider {
    static let videoList:[Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        NavigationView {
            VideoPlayerView(video: videoList[1])
        }
    }
}
