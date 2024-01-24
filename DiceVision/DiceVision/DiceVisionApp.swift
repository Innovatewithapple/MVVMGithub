//
//  DiceVisionApp.swift
//  DiceVision
//
//  Created by Himanshu vyas on 21/01/24.
//

import SwiftUI

@Observable
class DiceData {
    var rolledNumber = 0
}

@main
struct DiceVisionApp: App {
    @State var diceData = DiceData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(diceData: diceData)
        }
        .defaultSize(width: 500, height: 300)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView(diceData: diceData)
        }
    }
}
