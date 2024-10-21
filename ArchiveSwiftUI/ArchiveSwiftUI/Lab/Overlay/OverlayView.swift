//
//  OverlayView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 10/21/24.
//

import SwiftUI

struct OverlayView: View {
    
    @State private var viewSize: CGSize = .init()
    @State private var view2Size: CGSize = .init()
    
    var body: some View {
        Text("Hello, World! ~~~ ^^\nㅎㅎ~~ㅎㅎㅎ")
            .padding(.all, 20)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .readSize(onChange: { size in
                viewSize = size
            })
            .overlay {
                GeometryReader(content: { geometry in
                    Overlay2View()
                        .offset(
                            x: 0,
                            y: viewSize.height
                        )
                })
            }
    }
}

#Preview {
    OverlayView()
}
