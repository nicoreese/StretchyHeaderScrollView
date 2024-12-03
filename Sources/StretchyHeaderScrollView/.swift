//
//  StretchyHeaderScrollView 2.swift
//  StretchyHeaderScrollView
//
//  Created by Nico Reese on 03.12.24.
//


import SwiftUI

public struct StretchyHeaderScrollView<Content: View, Header: View, HeaderBackground: View>: View {
    
    /// The scroll view content following the header view.
    @ViewBuilder
    var content: () -> Content
    
    /// The header background.
    @ViewBuilder
    var headerBackground: () -> HeaderBackground
    
    /// The header content layered above `headerBackground`.
    @ViewBuilder
    var headerContent: () -> Header

    @State private var topOffset: CGFloat = 0
    @State private var safeAreaInsets: EdgeInsets = .init()
    
    public var body: some View {
        ScrollView {
            HeaderContainer(topOffset: -topOffset, safeAreaTop: safeAreaInsets.top) {
                headerContent()
            } headerBackground: {
                headerBackground()
            }
            
            content()
                .frame(maxWidth: .infinity)
                .offset(y: topOffset)
        }
        .ignoresSafeArea()
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
        LazyVStack {
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
