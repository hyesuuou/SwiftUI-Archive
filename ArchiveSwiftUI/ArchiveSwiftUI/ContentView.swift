//
//  ContentView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 7/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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
    }
}

extension ContentView {
    enum Row: CaseIterable, Hashable {
        case alignment
        case overlay
        case animation
        
        var destination: any View {
            switch self {
            case .alignment:
                AlignmentView()
            case .overlay:
                OverlayView()
            case .animation:
                AnimationLabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
