//
//  VideoPlayerHelper.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import Foundation
import AVKit

var videoPlayer:AVPlayer?

func playVidew(fileName:String, fileFormat:String) ->AVPlayer{
    
    if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat){
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
}
