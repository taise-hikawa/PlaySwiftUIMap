//
//  FloatingButtonStyle.swift
//  PlaySwiftUIMap
//
//  Created by 樋川大聖 on 2022/03/26.
//

import SwiftUI

struct FloatingButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.primary)
            .frame(width: 56, height: 56)
            .background(
                ZStack {
                    Circle()
                        .fill()
                        .foregroundColor(.white)
                    if configuration.isPressed {
                        Circle()
                            .fill()
                            .foregroundColor(.white)
                            .zIndex(1)
                    }
                }
            )
            .shadow(radius: 5)
    }
}

struct FloatingButtonStyle_Previews: PreviewProvider {

    static var previews: some View {
        Button(action: { }, label: {
            Image(systemName: "location")
        })
        .buttonStyle(FloatingButtonStyle())
    }
}
