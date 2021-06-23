//
//  MapView.swift
//  Africca
//
//  Created by Amit on 2021/05/28.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK:- Properties
    @State private var region:MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 6.600286)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations:[NationalParkLocation] = Bundle.main.decode("locations.json")
    
    
    //MARK:- Body
    var body: some View {
        //MARK:- Basic Map
        //Map(coordinateRegion: $region)
        
        //MARK:- Adbance Map -> Map with Annotation
        //        Map(coordinateRegion: $region, annotationItems:locations, annotationContent: { item in
        //
        //        })
        
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //old PIN Style
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //Marker new style (static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //Custom basic annotation (Interactive)
            //            MapAnnotation(coordinate: item.location){
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32.0, height: 32.0, alignment: .center)
            //            } //:MapAnnotation
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(loccation: item)
            }
        })//:Map
        .overlay(
            HStack(alignment:.center, spacing:12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment:.leading, spacing:3.0){
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }//:HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            ,alignment: .top
        )
    }
}

//MARK:- Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
