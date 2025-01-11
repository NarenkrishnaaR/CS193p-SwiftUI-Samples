//
//  ContentView.swift
//  CS193p-SwiftUI-Samples
//
//  Created by Naren on 29/12/24.
//

import SwiftUI

struct MemoryGameView: View {
  
  @State var viewModel = MemoryGameViewModel()
  var emojis = ["🦊", "🐮", "🐵", "🐶", "🦁", "🐼", "🐷", "🐯"]
  
  var body: some View {
    cards
    HStack {
      removeButton
      Spacer()
      addButton
    }
    .padding()
  }
  
  var cards: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
        ForEach(emojis.indices, id: \.self) { index in
          CardView(emoji: emojis[index])
        }
        .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .padding()
  }
  
  var addButton: some View {
    buttonAction(configureCard: 1, imageName: "rectangle.stack.fill.badge.plus")
    //      .disabled(cardCount >= emojis.count)
  }
  
  var removeButton: some View {
    buttonAction(configureCard: -1, imageName: "rectangle.stack.fill.badge.minus")
    //      .disabled(cardCount <= 0)
  }
  
  func buttonAction(configureCard: Int, imageName: String) -> some View {
    Button {
      //      cardCount += configureCard
    } label: {
      Image(systemName: imageName)
    }
    .imageScale(.large)
    .font(.title)
  }
}

struct CardView: View {
  let emoji: String
  
  @State var isSelected: Bool = true
  
  var body: some View {
    ZStack {
      let rectangle = RoundedRectangle(cornerRadius: 8)
      if isSelected {
        rectangle.fill(.yellow)
        Text(emoji).font(.largeTitle)
      } else {
        rectangle.fill()
      }
    }
    .onTapGesture {
      isSelected.toggle()
    }
  }
}

#Preview {
  MemoryGameView()
}
