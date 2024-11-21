//
//  DeliveryCloneViewModel.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 11/21/24.
//

import Foundation

final class DeliveryCloneViewModel: ObservableObject {
    @Published var 탭: [Tab] = []
    @Published var 가게목록: [Store] = []
    @Published var selectedTabId: String = ""
}

struct Store {
    let tabId: String
    let list: [DeliveryStore]
}
