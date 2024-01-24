//
//  ContentView.swift
//  QuoteWidget
//
//  Created by Himanshu vyas on 23/01/24.
//

import SwiftUI

struct ContentView: View {
    let quote: Quote
    
    var body: some View {
           VStack {
               Text(quote.text)
                   .font(.headline)
                   .padding()

               Text("- \(quote.author)")
                   .font(.subheadline)
           }
       }
}

//#Preview {
//    ContentView()
//}
