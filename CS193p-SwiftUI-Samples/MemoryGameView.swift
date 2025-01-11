//
//  ContentView.swift
//  CS193p-SwiftUI-Samples
//
//  Created by Naren on 29/12/24.
//

import SwiftUI

struct MemoryGameView: View {
  
  @ObservedObject var viewModel: MemoryGameViewModel
  
  var body: some View {
    VStack {
      cards
      shuffluButton
    }
    .padding()
  }
  
  var shuffluButton: some View {
    Button("Shuffle") {
      viewModel.shuffle()
    }
  }
  
  var cards: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
        ForEach(viewModel.cards.indices, id: \.self) { index in
          CardView(viewModel.cards[index])
            .aspectRatio(2/3, contentMode: .fit)
            .padding(2)
        }
      }
    }
    .padding()
  }
}

struct CardView: View {
  private var card: MemoryGameModel<String>.Card
  
  init(_ card: MemoryGameModel<String>.Card) {
    self.card = card
  }
  
  var body: some View {
    ZStack {
      let rectangle = RoundedRectangle(cornerRadius: 12)
      Group {
        rectangle.fill(.white)
        rectangle.strokeBorder(lineWidth: 2)
        Text(card.content)
          .font(.system(size: 200))
          .minimumScaleFactor(0.01)
          .aspectRatio(1, contentMode: .fit)
      }
      .opacity(card.isFaceUp ? 1 : 0)
      rectangle.fill()
        .opacity(card.isFaceUp ? 0 : 1)
    }
  }
}

#Preview {
  MemoryGameView(viewModel: MemoryGameViewModel())
}
