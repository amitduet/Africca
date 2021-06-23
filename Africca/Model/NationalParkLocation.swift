//
//  Location.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import Foundation
import MapKit

struct NationalParkLocation:Codable, Identifiable {
    let id:String
    let name:String
    let image:String
    let latitude:Double
    let longitude:Double
    
    //Computed Proeprty
    var location:CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
