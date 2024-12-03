//
//  SafeAreaInsetsKey.swift
//  StretchyHeaderScrollView
//
//  Created by Nico Reese on 03.12.24.
//

import SwiftUI

struct SafeAreaInsetsKey: PreferenceKey {
    static let defaultValue = EdgeInsets()
    static func reduce(value: inout EdgeInsets, nextValue: () -> EdgeInsets) {
        value = nextValue()
    }
}

extension View {
    /// Get the safe area insets for the view this modifier is attached to.
    /// - Parameter safeInsets: The safe area insets for this view.
    func getSafeAreaInsets(_ safeInsets: Binding<EdgeInsets>) -> some View {
        background(
            GeometryReader { proxy in
                Color.clear
                    .preference(key: SafeAreaInsetsKey.self, value: proxy.safeAreaInsets)
            }
                .onPreferenceChange(SafeAreaInsetsKey.self) { value in
                    safeInsets.wrappedValue = value
                }
        )
    }
}
