//
//  MapView.swift
//  PlaySwiftUIMap
//
//  Created by 樋川大聖 on 2022/03/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel = MapViewModel()
    var body: some View {
        Map(coordinateRegion: $viewModel.region,
            showsUserLocation: true)
        .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
