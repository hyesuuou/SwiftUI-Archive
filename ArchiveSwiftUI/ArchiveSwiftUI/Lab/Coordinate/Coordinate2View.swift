//
//  Coordinate2View.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/20/24.
//

import SwiftUI

struct Coordinate2View: View {
    @State private var location: CGPoint = .zero
    var body: some View {
        VStack {
            Text("hi~~")
                .frame(height: 100)
            VStack {
                Text("파란거의 위치 찾기")
                    .frame(height: 40)
                GeometryReader { proxy in
                    VStack {
                        Text("global: \(proxy.frame(in: .global))")
                        Spacer()
                        Rectangle()
                            .foregroundStyle(Color.red)
                        VStack {
                            Text("노란곳에서 custom : \(proxy.frame(in: .named("custom")))")
                        }
                        .coordinateSpace(name: "custom")
                        Spacer()
                        Text("local: \(proxy.frame(in: .local))")
                    }
                }
                .background(Color.blue)
                
                Spacer()
            }
            .background(Color.yellow)
            .coordinateSpace(name: "custom")
            
            Text("hi~~")
                .frame(height: 100)
        }
    }
}

#Preview {
    Coordinate2View()
}
