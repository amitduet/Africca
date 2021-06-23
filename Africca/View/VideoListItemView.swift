//
//  VideoListItem.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK:- Properties
    let video:Video
    
    //MARK:- Body
    var body: some View {
        HStack (spacing:10){
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .frame(height: 90.0)
                    .scaledToFit()
                    .cornerRadius(9.0)
                
                Image.init(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height:32.0)
                    .shadow(radius: 4.0)
            }//:ZStack
            VStack (alignment:.leading, spacing:10){
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//:VStack
        }//:HStack
    }
}

//MARK:- Preview
struct VideoListItem_Previews: PreviewProvider {
    static let videoList:[Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videoList[0]).previewLayout(.sizeThatFits)
            .padding()
    }
}
