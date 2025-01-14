//
//  MemoryGameViewModel.swift
//  CS193p-SwiftUI-Samples
//
//  Created by Naren on 05/01/25.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
  
  private(set) var cards: Array<Card>
  
  init(numberOfPairs: Int, content: (Int) -> CardContent) {
    cards = []
    for pair in 0..<max(2, numberOfPairs) {
      let content = content(pair)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  mutating func choose(_ card: Card) {
    guard let index = cards.firstIndex(of: card) else {
      return
    }
    cards[index].isFaceUp.toggle()
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
  
  func flipCard(_ card: Card) { }
  
  struct Card: Equatable, Identifiable {
    var id = UUID().uuidString
    
    var isFaceUp = true
    var isMatched = false
    var content: CardContent
    
  }
}
