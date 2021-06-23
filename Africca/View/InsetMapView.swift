//
//  InsetMapView.swift
//  Africca
//
//  Created by Amit on 2021/05/30.
//

import SwiftUI
import MapKit
struct InsetMapView: View {
    //MARK:- Propteris
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    //MARK:- Body
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink(
                    destination: MapView(),
                    label: {
                        HStack {
                            Image(systemName: "mappin.circle")
                                .foregroundColor(.white)
                                .imageScale(.large)
                            Text("Location")
                                .foregroundColor(.accentColor)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 14)
                        .background(
                            Color(.black)
                                .opacity(0.4)
                                .cornerRadius(8.0)
                        )
                    })// Navigation Link
                    .padding(12)
                ,alignment: .topTrailing
            )
            .frame(height:256.0)
            .cornerRadius(12.0)
    }
}

//MARK:- Preview
struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView().previewLayout(.sizeThatFits)
            .padding()
    }
}
