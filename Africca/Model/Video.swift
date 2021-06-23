//
//  Video.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import Foundation

struct Video:Codable, Identifiable {
    let id:String
    let name:String
    let headline:String
    
    //Computed Property
    
    var thumbnail:String{
        "video-\(id)"
    }
}
