//
//  AlignmentView.swift
//  ArchiveSwiftUI
//
//  Created by 김혜수 on 8/25/24.
//

import SwiftUI

///
/// **alignmentGuide: 뷰의 정렬선이 어딜 통과하는지!!!!!!!!!**
///
/// 허용 범위를 넘으면 다음 줄로 넘기는데 정렬이 trailing인 뷰
struct AlignmentView: View {
    var body: some View {
        var firstWidth = CGFloat.zero
        var firstHeight = CGFloat.zero
        GeometryReader { geometry in
            ZStack(alignment: .topTrailing) {
                TextLabel(label: "월월요일일월월요일일")
                    .alignmentGuide(.trailing, computeValue: { dimension in
                        firstWidth = dimension.width
                        firstHeight = dimension.height
                        return dimension[.trailing]
                    })
                TextLabel(label: "화요일화화요일화화요일")
                    .alignmentGuide(.trailing, computeValue: { dimension in
                        if geometry.size.width >= firstWidth + dimension.width {
                            return 0
                        }
                        return dimension[.trailing]
                    })
                    .alignmentGuide(.top, computeValue: { dimension in
                        if geometry.size.width >= firstWidth + dimension.width {
                            return 0
                        }
                        return dimension[.top] - firstHeight
                    })
            }
            .frame(width: geometry.size.width, alignment: .trailing)
            .background(Color.yellow)
        }
    }
}

struct TextLabel: View {
    let label: String
    var body: some View {
        Text(label)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color.red.opacity(0.9))
            )
            .foregroundColor(.white)
    }
}

#Preview {
    AlignmentView()
}
