//
//  VideoListView.swift
//  Africca
//
//  Created by Amit on 2021/05/28.
//

import SwiftUI
/* Hapticks
 hapticks are desinged enhanced user experience with your iPhone implementing
 **/
struct VideoListView: View {
    //MARK:- Properties
    @State var videos:[Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //MARK:- Body
    var body: some View {
        NavigationView {
            List(videos) { video in
                NavigationLink(destination:VideoPlayerView(video: video)) {
                    VideoListItemView(video: video)
                        .padding(.vertical, 8.0)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Video", displayMode: .inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()  // Testing in real device
                    }, label: {
                        Image(systemName: "arrow.2.squarepath")
                    })
                }
            }
        }//:NavigationView
        
    }
}

//MARK:- Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
