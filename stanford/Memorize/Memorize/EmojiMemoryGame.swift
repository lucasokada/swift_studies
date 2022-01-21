//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Lucas Eiki Okada on 03/04/21.
//


//View Model -> interpretar as intenções do usuário
//Faz com que as views cheguem no model. Como um portal, portão, porta ...

//por que uma classe? a maior vantagem da classe é que é fácil de compartilhar pois vive na heap. Em projetos é comum ter muitas views e todas essas views vão querer ter acesso ao model, e para isso precisam passar pelo View Model.
//A maior vantagem da classe também é sua faqueza. Qualque view pode modificar o View Model, podendo causar erros e dificultar a identificação desse erro.
import SwiftUI

class EmojiMemoryGame {
    
//    func createCardContent(pairIndex: Int) -> String {
//        return "😀"
//    }
    
    //1
    //private(set) var model// Private(set) apenas a classe atual pode modificar a variável, contudo, esta é visível para todas as models -> A porta está fechada, mas é uma porta de vidro
    
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
   static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃"]
    //1forma
//    memoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { pairIndex in "😀" })
    return MemoryGame<String>(numberOfPairOfCards: 2) { pairIndex in return emojis[pairIndex] }
    }
    
    
    //MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {     //queremos que nossas views sejam o mais simples possível
        return model.cards                          //o trabalho do view model é apresentar o model para as views
    }
    
    //MARK: -Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}




