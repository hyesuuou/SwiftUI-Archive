//
//  CustomTabView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/19/24.
//

import SwiftUI

struct CustomTabView: View {
    private var tabs: [Tab] = []
    @Binding var selectedId: String
    
    init(
        tabs: [Tab],
        selectedId: Binding<String>
    ) {
        self.tabs = tabs
        self._selectedId = selectedId
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(tabs, id: \.id) { tab in
                    tabView(
                        tab: tab,
                        isSelected: tab.id == selectedId
                    )
                    .onTapGesture {
                        selectedId = tab.id
                    }
                }
            }
            .padding(.horizontal, 20)
        }
       // .scrollIndicators(.hidden)
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
            .init(id: "0", title: "야식"),
            .init(id: "1", title: "양식"),
            .init(id: "2", title: "족발 보쌈"),
            .init(id: "3", title: "양식"),
            .init(id: "4", title: "양식"),
            .init(id: "5", title: "돈까스.회·일식"),
            .init(id: "6", title: "족발 보쌈"),
            .init(id: "7", title: "양식"),
        ],
        selectedId: .constant("0")
    )
}
