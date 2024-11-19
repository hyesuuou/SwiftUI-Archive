//
//  CustomTabView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/19/24.
//

import SwiftUI

/// 배민 탭바
struct CustomTabView: View {
    private var tabs: [Tab] = []
    @Binding var selectedIdx: Int
    
    init(
        tabs: [Tab],
        selectedIdx: Binding<Int>
    ) {
        self.tabs = tabs
        self._selectedIdx = selectedIdx
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(tabs, id: \.id) { tab in
                    tabView(
                        tab: tab,
                        isSelected: tab.id == tabs[selectedIdx].id
                    )
                    .onTapGesture {
                        selectedIdx = tabs.firstIndex(where: { tmp in
                            tmp.id == tab.id
                        }) ?? 0
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
        .frame(height: 32)
    }
    
    private func tabView(
        tab: Tab,
        isSelected: Bool
    ) -> some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            Text(tab.title)
                .fontWeight(.semibold)
                .font(.system(size: 14))
                .padding(.bottom, 7)
                .foregroundStyle(isSelected ? .black: .gray)
            
            Rectangle()
                .foregroundStyle(isSelected ? Color.black: .clear)
                .frame(height: 5)
        }
    }
}

#Preview {
   // @Previewable @State var username = "Anonymous"
    
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
        selectedIdx: .constant(0)
    )
}
