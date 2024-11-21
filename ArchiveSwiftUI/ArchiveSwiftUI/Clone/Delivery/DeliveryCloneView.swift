//
//  DeliveryCloneView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/21/24.
//

import SwiftUI
import UIKit

/// 배민 가게리스트 뷰 만들어보기
struct DeliveryStoreListCloneView: View {
    @StateObject private var viewModel = DeliveryCloneViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            tabView
            lineView
            
            storeListHorizontalScrollView
        }
        .onAppear {
            setDummyData()
        }
        .task {
            await setStoreListDummyData()
        }
    }
}

private extension DeliveryStoreListCloneView {
    var tabView: some View {
        CustomTabView(
            tabs: viewModel.탭,
            selectedId: $viewModel.selectedTabId
        )
    }
    
    var lineView: some View {
        Divider()
            .foregroundStyle(Color.init(hex: "D5D6D8"))
    }
    
    var storeListHorizontalScrollView: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(viewModel.탭, id: \.id) { tab in
                        storeListView(tabId: tab.id)
                            .background(Color.yellow)
                            .frame(
                                width: proxy.size.width,
                                height: proxy.size.height)
                    }
                }
            }
            .paging()
        }
    }
    
    func storeListView(tabId: String) -> some View {
        Rectangle()
            .foregroundStyle(.red)
    }
    
    func storeItemView(store: DeliveryStore) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Color.gray
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading, spacing: 7) {
                Text(store.가게이름)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.black)
                
            }
        }
    }
}
    
// MARK: - 더미데이터 추가

private extension DeliveryStoreListCloneView {
    func setDummyData() {
        viewModel.탭 = [
            .init(id: "0", title: "야식"),
            .init(id: "1", title: "양식"),
            .init(id: "2", title: "족발 보쌈"),
            .init(id: "3", title: "양식"),
            .init(id: "4", title: "양식"),
            .init(id: "5", title: "돈까스.회·일식"),
            .init(id: "6", title: "족발 보쌈"),
            .init(id: "7", title: "양식"),
        ]
        viewModel.selectedTabId = viewModel.탭.first?.id ?? "0"
    }
    
    func setStoreListDummyData() async {
        if viewModel.가게목록.contains(where: { $0.tabId == viewModel.selectedTabId }) {
            return
        }
        
        try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2 second
        viewModel.가게목록.append(
            .init(
                tabId: viewModel.selectedTabId,
                list: [
                    .init(
                        가게이름: "김선생불닭발 분당점",
                        별점: "5.0(30+)",
                        대표메뉴: "매콤 돼지껍데기 단품 (150g)",
                        배달시간: "40~55분",
                        배달팁: "무료",
                        최소주문: "3,000원",
                        포장가능여부: true,
                        쿠폰여부: true
                    ),
                    .init(
                        가게이름: "김선생불닭발 분당점",
                        별점: "5.0(30+)",
                        대표메뉴: "매콤 돼지껍데기 단품 (150g)",
                        배달시간: "40~55분",
                        배달팁: "무료",
                        최소주문: "3,000원",
                        포장가능여부: true,
                        쿠폰여부: true
                    ),
                    .init(
                        가게이름: "김선생불닭발 분당점",
                        별점: "5.0(30+)",
                        대표메뉴: "매콤 돼지껍데기 단품 (150g)",
                        배달시간: "40~55분",
                        배달팁: "무료",
                        최소주문: "3,000원",
                        포장가능여부: true,
                        쿠폰여부: true
                    ),
                    .init(
                        가게이름: "김선생불닭발 분당점",
                        별점: "5.0(30+)",
                        대표메뉴: "매콤 돼지껍데기 단품 (150g)",
                        배달시간: "40~55분",
                        배달팁: "무료",
                        최소주문: "3,000원",
                        포장가능여부: true,
                        쿠폰여부: true
                    )
                ]
            )
        )
    }
}
//
#Preview {
    DeliveryStoreListCloneView()
}
