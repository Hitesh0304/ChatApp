//
//  ChatAppWidgetLiveActivity.swift
//  ChatAppWidget
//
//  Created by Hitesh Moudgil on 2023-12-02.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ChatAppWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ChatAppWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ChatAppWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ChatAppWidgetAttributes {
    fileprivate static var preview: ChatAppWidgetAttributes {
        ChatAppWidgetAttributes(name: "World")
    }
}

extension ChatAppWidgetAttributes.ContentState {
    fileprivate static var smiley: ChatAppWidgetAttributes.ContentState {
        ChatAppWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ChatAppWidgetAttributes.ContentState {
         ChatAppWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ChatAppWidgetAttributes.preview) {
   ChatAppWidgetLiveActivity()
} contentStates: {
    ChatAppWidgetAttributes.ContentState.smiley
    ChatAppWidgetAttributes.ContentState.starEyes
}
