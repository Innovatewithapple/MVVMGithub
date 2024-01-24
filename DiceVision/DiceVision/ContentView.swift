//
//  ContentView.swift
//  DiceVision
//
//  Created by Himanshu vyas on 21/01/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    var diceData:DiceData

    var body: some View {
        VStack {
            Text(diceData.rolledNumber == 0 ?"🎲" : "🎲:\(diceData.rolledNumber)")
                .foregroundStyle(.black)
                .font(.custom("Menlo", size: 120))
                .bold()
        }
        .task {
            await openImmersiveSpace(id: "ImmersiveSpace")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(diceData: DiceData())
}
