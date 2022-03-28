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
    @State private var showingAlert = false

    private func pinButton(pin: MapViewModel.PinItem) -> some View {
        Button(action: {
            viewModel.selectedPin = pin
        }, label: {
            Image(systemName: "house")
                .foregroundColor(.black)
                .padding(6)
                .background(
                    Circle()
                        .strokeBorder(.black, lineWidth: 2)
                        .background(Circle().foregroundColor(.white))

                )
        })
    }
    var body: some View {
        Map(coordinateRegion: $viewModel.region,
            showsUserLocation: true,
            annotationItems: viewModel.pins,
            annotationContent: { item in
            MapAnnotation(coordinate: item.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5), content: {
                pinButton(pin: item)
            })
        })
        .alert("ピンが選択されました", isPresented: $viewModel.presentingAlert, presenting: viewModel.selectedPin) { _ in
            Button(role: .cancel, action: {
                viewModel.selectedPin = nil
            }, label: {
                Text("OK")
            })
        } message: { item in
            Text(item.text)
        }
        .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
