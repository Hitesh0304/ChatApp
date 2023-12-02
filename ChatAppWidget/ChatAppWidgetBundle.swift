//
//  ChatAppWidgetBundle.swift
//  ChatAppWidget
//
//  Created by Hitesh Moudgil on 2023-12-02.
//

import WidgetKit
import SwiftUI

@main
struct ChatAppWidgetBundle: WidgetBundle {
    var body: some Widget {
        ChatAppWidget()
        ChatAppWidgetLiveActivity()
    }
}
