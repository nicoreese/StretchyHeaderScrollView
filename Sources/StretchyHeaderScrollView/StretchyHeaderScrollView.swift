//
//  StretchyHeaderScrollView.swift
//  StretchyHeaderScrollView
//
//  Created by Nico Reese on 03.12.24.
//

import SwiftUI

public struct StretchyHeaderScrollView<Content: View, Header: View, HeaderBackground: View>: View {
    
    /// The scroll view content following the header view.
    @ViewBuilder
    public var content: Content
    
    /// The header background.
    @ViewBuilder
    public var headerBackground: HeaderBackground
    
    /// The header content layered above `headerBackground`.
    @ViewBuilder
    public var headerContent: Header
    
    @State private var topOffset: CGFloat = 0
    @State private var safeAreaInsets: EdgeInsets = .init()
    
    public init(
        @ViewBuilder content: () -> Content,
        @ViewBuilder headerBackground: () -> HeaderBackground,
        @ViewBuilder headerContent: () -> Header
    ) {
        self.content = content()
        self.headerBackground = headerBackground()
        self.headerContent = headerContent()
    }
    
    public var body: some View {
        ScrollView {
            HeaderContainer(topOffset: -topOffset, safeAreaTop: safeAreaInsets.top) {
                headerContent
            } headerBackground: {
                headerBackground
            }
            
            content
                .frame(maxWidth: .infinity)
                .offset(y: topOffset)
        }
        .ignoresSafeArea(.all, edges: .top)
        .contentMargins(.top, safeAreaInsets.top, for: .scrollIndicators)
        .scrollOffset($topOffset)
        .getSafeAreaInsets($safeAreaInsets)
    }
}

fileprivate struct HeaderContainer<Content: View, HeaderBackground: View>: View {
    let topOffset: CGFloat
    let safeAreaTop: CGFloat
    
    var content: () -> Content
    var headerBackground: () -> HeaderBackground
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: topOffset + safeAreaTop)
            
            content()
        }
        .background(
            headerBackground()
        )
        .clipped()
        .offset(y: -topOffset)
    }
}
