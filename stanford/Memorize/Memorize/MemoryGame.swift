//
//  MemoryGame.swift
//  Memorize
//
//  Created by Lucas Eiki Okada on 03/04/21.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int)->CardContent) { //segundo argumento é uma função que recebe um int e retorna um CardContent
        cards = Array<Card>()
        for pairIndex in 0 ..< numberOfPairOfCards { //nao inclui o numberOfPairOfCards
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
