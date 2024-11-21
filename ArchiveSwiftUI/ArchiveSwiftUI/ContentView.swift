//
//  ContentView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 7/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                List(
                    Row.allCases,
                    id: \.self
                ) { row in
                    NavigationLink("\(row)") {
                        AnyView(row.destination)
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

extension ContentView {
    enum Row: CaseIterable, Hashable {
        case alignment
        case overlay
        case animation
        case 상단탭바_좌우페이징
        case 배민_가게목록_클론
        
        var destination: any View {
            switch self {
            case .alignment:
                AlignmentView()
            case .overlay:
                OverlayView()
            case .animation:
                AnimationLabView()
            case .상단탭바_좌우페이징:
                PageTabView()
            case .배민_가게목록_클론:
                DeliveryStoreListCloneView()
            }
        }
    }
}

#Preview {
    ContentView()
}
