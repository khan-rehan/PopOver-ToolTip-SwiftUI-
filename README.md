# PopOver ToolTip - SwiftUI

A lightweight, custom popover/tooltip component for SwiftUI navigation bars. Displays floating popover windows with smooth animations and an arrow shape pointing to the trigger element.

## Features

- Custom arrow-shaped popover with rounded corners
- Two placement options: `.leading` and `.trailing`
- Smooth show/hide animations
- Background dimming when popover is active
- Extension-based API — non-invasive and reusable
- No external dependencies

## Usage

1. Copy `PopOver.swift` into your project

2. Add the modifier to any view:

```swift
@State private var showPopover = false

var body: some View {
    NavigationView {
        Text("Hello")
            .toolbar {
                Button(action: { showPopover.toggle() }) {
                    Image(systemName: "info.circle")
                }
            }
            .toolBarPopover(show: $showPopover, placement: .trailing) {
                // Your custom content
                DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(.wheel)
                    .labelsHidden()
            }
    }
}
```

## API

```swift
.toolBarPopover(show: Binding<Bool>, placement: Placement, content: () -> Content)
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `show` | `Binding<Bool>` | Controls popover visibility |
| `placement` | `Placement` | Arrow position: `.leading` or `.trailing` |
| `content` | `@ViewBuilder` | Custom view content for the popover |

## Project Structure

```
├── PopOver.swift       # Core popover modifier & custom arrow shape
└── popOverPage.swift   # Example/demo usage
```

## Requirements

- iOS 13+
- Swift 5+
- SwiftUI
