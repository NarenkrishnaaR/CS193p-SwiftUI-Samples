//
//  MemoryGameViewModel.swift
//  CS193p-SwiftUI-Samples
//
//  Created by Naren on 05/01/25.
//

import Foundation
import SwiftUI

class MemoryGameViewModel: ObservableObject {
  
  private static let emojis = ["🦊", "🐮", "🐵", "🐶", "🦁", "🐼", "🐷", "🐯","🐴","🦖","🐺","🐗"]
  
  @Published private var model = createMemoryGame()
  
  var cards: Array<MemoryGameModel<String>.Card> {
    return model.cards
  }
  
  static func createMemoryGame() -> MemoryGameModel<String> {
    MemoryGameModel(numberOfPairs: 16) { index in
      if emojis.indices.contains(index) {
        return emojis[index]
      }
      return "❌"
    }
  }
  
  func shuffle() {
    model.shuffle()
  }
  
  func choose(_ card: MemoryGameModel<String>.Card) {
    model.choose(card)
  }
  
}
