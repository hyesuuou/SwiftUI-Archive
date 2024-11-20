//
//  Coordinateview.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/20/24.
//

import SwiftUI

struct CoordinateView: View {
    @State private var location = CGPoint.zero
    
    var body: some View {
        VStack {
            Color.yellow
                .frame(width: 300, height: 300)
                .overlay(
                    circle
                )
            
            Text("location: \(Int(location.x)) \(Int(location.y))")
        }
        .coordinateSpace(name: "vstack")
    }
    
    private var circle: some View {
        Circle()
            .frame(width: 25, height: 25)
            .gesture(
                DragGesture(coordinateSpace: .named("vstack"))
                    .onChanged {
                        location = $0.location
                    }
            )
    }
}

#Preview {
    CoordinateView()
}
