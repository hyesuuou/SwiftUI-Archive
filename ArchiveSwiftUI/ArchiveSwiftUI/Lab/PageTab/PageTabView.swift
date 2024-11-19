//
//  PageTabView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/19/24.
//

import SwiftUI

struct PageTabView: View {
    @State private var selectedTabIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            tabView
            
            Divider()
                .foregroundStyle(Color.init(hex: "D5D6D8"))
            
            Spacer() // TODO: TableView Representing 이용해서 만들기
        }
    }
}

private extension PageTabView {
    var tabView: some View {
        CustomTabView(
            tabs: [
                .init(title: "야식"),
                .init(title: "양식"),
                .init(title: "족발 보쌈"),
                .init(title: "양식"),
                .init(title: "양식"),
                .init(title: "돈까스.회·일식"),
                .init(title: "족발 보쌈"),
                .init(title: "양식"),
            ],
            selectedIdx: $selectedTabIndex
        )
    }
}

#Preview {
    PageTabView()
}
