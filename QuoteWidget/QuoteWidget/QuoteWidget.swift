//
//  QuoteWidget.swift
//  QuoteWidget
//
//  Created by Himanshu vyas on 23/01/24.
//

import Foundation
import SwiftUI
import AppIntents
import WidgetKit
@main
struct QuotesWidget: Widget {
    private let kind: String = "QuotesWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ContentView(quote: entry.quote)
        }
        .configurationDisplayName("View Size Widget")
               .description("This is a demo widget.")
               .supportedFamilies([
                   .systemSmall,
                   .systemMedium,
                   .systemLarge,
               ])
    }
}

// QuotesWidget.swift
struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> QuotesWidgetEntry {
        QuotesWidgetEntry(date: Date(), quote: QuoteDataSource.quotes.first ?? Quote(text: "", author: ""))
    }

    func getSnapshot(in context: Context, completion: @escaping (QuotesWidgetEntry) -> ()) {
        let entry = QuotesWidgetEntry(date: Date(), quote: QuoteDataSource.quotes.first ?? Quote(text: "", author: ""))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<QuotesWidgetEntry>) -> ()) {
        // Update the widget every hour with a new quote
        let currentDate = Date()
        let nextHour = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate) ?? currentDate
        let entry = QuotesWidgetEntry(date: nextHour, quote: QuoteDataSource.quotes.randomElement() ?? Quote(text: "", author: ""))
        let timeline = Timeline(entries: [entry], policy: .after(nextHour))
        completion(timeline)
    }
}
// QuotesWidget.swift
struct QuotesWidgetEntry: TimelineEntry {
    let date: Date
    let quote: Quote
}
