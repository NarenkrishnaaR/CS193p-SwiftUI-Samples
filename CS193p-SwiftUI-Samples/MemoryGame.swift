//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Naren on 29/12/24.
//

import SwiftUI

@main
struct MemoryGame: App {
  
  @StateObject var memoryGameViewModel = MemoryGameViewModel()
  
  var body: some Scene {
    WindowGroup {
      MemoryGameView(viewModel: memoryGameViewModel)
    }
  }
}
