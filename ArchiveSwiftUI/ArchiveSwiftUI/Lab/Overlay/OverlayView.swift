//
//  OverlayView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 10/21/24.
//

import SwiftUI

struct OverlayView: View {
    
    @State private var viewSize: CGSize = .init()
    @State private var isPresentOverlay: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Text("Hello, World! ~~~ ^^\nㅎㅎ~~ㅎㅎㅎ")
                        .padding(.all, 20)
                        .background(Color.red)
                        .onTapGesture {
                            isPresentOverlay.toggle()
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .readSize(onChange: { size in
                            viewSize = size
                        })
                }
            }
        }
        .overlay {
            if isPresentOverlay {
                GeometryReader(content: { geometry in
                    Overlay2View()
                        .offset(
                            x: 0,
                            y: viewSize.height
                        )
                        .onTapGesture {
                            print("터치안되게하기")
                        }
                })
                .background(Color.blue.opacity(0.5))
                .onTapGesture {
                    isPresentOverlay = false
                }
            }
        }
    }
}

#Preview {
    OverlayView()
}
