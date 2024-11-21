//
//  View+.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 10/21/24.
//

import SwiftUI

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
    
    func paging() -> some View {
        if #available(iOS 17.0, *) {
            return self.scrollTargetBehavior(.paging)
        } else {
            return self.onAppear {
                UIScrollView.appearance().isPagingEnabled = true
            }
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
