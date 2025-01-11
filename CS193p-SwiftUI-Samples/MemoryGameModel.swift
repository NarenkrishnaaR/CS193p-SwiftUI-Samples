//
//  MemoryGameViewModel.swift
//  CS193p-SwiftUI-Samples
//
//  Created by Naren on 05/01/25.
//

struct MemoryGameModel<CardContent> {
  
  private(set) var cards: Array<Card>
  
  init(numberOfPairs: Int, content: (Int) -> CardContent) {
    cards = []
    for pair in 0..<max(2, numberOfPairs) {
      let content = content(pair)
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
  }
  
  func choose(_ card: Card) {
    
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
  
  func flipCard(_ card: Card) { }
  
  struct Card {
    var isFaceUp = true
    var isMatched = false
    var content: CardContent
  }
}
