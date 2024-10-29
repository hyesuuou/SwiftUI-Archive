//
//  AnimationLabView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 10/29/24.
//

import SwiftUI

struct AnimationLabView: View {
    @State private var isSelected: Bool = false
    var body: some View {
        VStack {
            Image(.dog)
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(isSelected ? 1.5 : 1)
                .onTapGesture {
                    withAnimation {
                        isSelected.toggle()
                    }
                }
        }
    }
}

#Preview {
    AnimationLabView()
}
