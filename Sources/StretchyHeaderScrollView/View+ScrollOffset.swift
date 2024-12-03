//
//  View+ScrollOffset.swift
//  StretchyHeaderScrollView
//
//  Created by Nico Reese on 03.12.24.
//

import SwiftUI

extension View {
    /// The scroll offset for the scroll view this modifier is attached to.
    /// - Parameter offset: The current offset needed to support stretching. Positive values are ignored and returned as 0 as we only need negative values (scrolling up beyond the top).
    func scrollOffset(_ offset: Binding<CGFloat>) -> some View {
        onScrollGeometryChange(for: Double.self) { geo in
            min(0, geo.contentOffset.y)
        } action: { oldValue, newValue in
            offset.wrappedValue = newValue
        }
    }
}
