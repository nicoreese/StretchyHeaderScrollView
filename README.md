#  StretchyHeaderScrollView

![me](https://github.com/nicoreese/StretchyHeaderScrollView/blob/main/Intro.gif)

Want to implement a scroll view with a stretchy header in SwiftUI? But you don't want to use GeometryReader? And you don't want to have a fixed height for the header? Look no further.

* No use of GeometryReader
* Super easy to adopt
* Header uses it's natural height, no hardcoded values needed
* Super stretchy, super smooth
* Requires iOS 18, due to use of onScrollGeometryChange to get the scroll offset

```swift
StretchyHeaderScrollView {
    // Other content elements that should be displayed below the header, like the Hello text in the preview above.
} headerBackground: {
    // A background view, like the gradient in the preview above.

    // Image("test")
    //    .resizable()
    //    .scaledToFill()

    // LinearGradient(...)
            
    // Color.gray
} headerContent: {
    // The header content. Could be Text and Image elements like in the preview above.
}
```
