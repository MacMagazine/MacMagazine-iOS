//
//  MacMagazineWidgetExtension.swift
//  MacMagazineWidgetExtension
//
//  Created by Ailton Vieira Pinto Filho on 16/01/21.
//  Copyright © 2021 MacMagazine. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct MacMagazineWidgetExtension: Widget {
    let kind: String = "MacMagazineRecentPostsWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: RecentPostsProvider()) { entry in
            RecentPostsWidget(entry: entry)
        }
        .configurationDisplayName("Notícias Recentes")
        .description("Acompanhe as últimas notícias do universo Apple.")
    }
}

struct MacMagazineWidgetExtension_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecentPostsWidget(entry: RecentPostsEntry(date: Date(), configuration: ConfigurationIntent(), posts: []))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
