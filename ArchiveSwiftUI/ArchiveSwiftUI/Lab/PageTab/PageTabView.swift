//
//  PageTabView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/19/24.
//

import SwiftUI

struct PageTabView: View {
    @State private var selectedTabId: String = "0"
    
    var body: some View {
        VStack(spacing: 0) {
            tabView
            
            Divider()
                .foregroundStyle(Color.init(hex: "D5D6D8"))
            
//            // TODO: TableView Representing 이용해서 만들기
//            // TODO: 하단 좌우 스크롤 가능하게
//            ScrollView(.horizontal) {
//                LazyHStack(spacing: 0) {
//                    Rectangle()
//                        .foregroundStyle(.red)
//                        .frame(width: UIScreen.)
//                    
//                    Rectangle()
//                        .foregroundStyle(.yellow)
//                        .containerRelativeFrame(.horizontal)
//                    
//                    Rectangle()
//                        .foregroundStyle(.green)
//                        .containerRelativeFrame(.horizontal)
//                }
//            }
//            .scrollTargetBehavior(.paging)
        }
    }
}

private extension PageTabView {
    var tabView: some View {
        CustomTabView(
            tabs: [
                .init(id: "0", title: "야식"),
                .init(id: "1", title: "양식"),
                .init(id: "2", title: "족발 보쌈"),
                .init(id: "3", title: "양식"),
                .init(id: "4", title: "양식"),
                .init(id: "5", title: "돈까스.회·일식"),
                .init(id: "6", title: "족발 보쌈"),
                .init(id: "7", title: "양식"),
            ],
            selectedId: $selectedTabId
        )
    }
}

#Preview {
    PageTabView()
}
