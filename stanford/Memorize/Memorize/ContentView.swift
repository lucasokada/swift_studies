//
//  ContentView.swift
//  Memorize
//
//  Created by Lucas Eiki Okada on 01/04/21.
//

//A VIEW SEMPRE DESEJA USAR A VIEW MODEL PARA ACESSAR OQUE ESTA NO MODELO
//A VIEW REFLETE O ATUAL ESTADO DO MODEL

import SwiftUI

struct ContentView: View { // funciona como uma view. Não é orientada a objetos. Isso é programacao funcional
    var viewModel: EmojiMemoryGame
    var body: some View { //o tipo dessa propriedade tipo/estrutura que se comporte como uma view.
        
        //Quando desejamos criar uma view precisamos do var body
        
        //Se quisermos algo que se comporte como uma view, precisamos de uma var body, que se comporta como view. "Pra ser uma view, preciso ter uma var que é view como meu corpo"
        //As views podem ser vistas como legos, que são estruturas simples, que quando juntas podem formar estruturas complexas
        
        //{} após a variável body indica que essa var não é armazenada na memória, em vez disso essa var é calculada. Toda vez que essa var é chamada, esse bloco de código é executado e o valor é retornado
        
        //A medida que a view vai ficando mais complexa em um código, o retorno some view vai mudando. Com isso a var body tem como responsabilidade, quando for chamada, executar seu bloco de código, assegurar que o retorno se comporte como uma view e retornar o valor.
//        return Text("👻") //tem como retorno um Text
            
        HStack() {
            //ForEach(0..<4, content: { index in  //intervalo de 0 a 4 sem incluir 4
            ForEach(viewModel.cards) { card in //forma mais reduzida
                //ZStack(content: { //tem apenas um argumento. Portanto podemos fazer como está abaixo
                //ZStack() { //se não temos nenhum argumento, podemos fazer como está abaixo
                CardView(card: card).onTapGesture { 
                    self.viewModel.choose(card: card)
                }
            }
        }
        .foregroundColor(.orange)
        .padding() //padding coloca preenchimento ao redor de uma view
        .font(Font.largeTitle)
        
        //return RoundedRectangle(cornerRadius: 10.0)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        } //é uma estrutura que se comporta como view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}

//ZStack é uma estrutura que se comporta como uma view. Tem como argumento um conteúdo, que é uma lista de visualizações que são empilhadas
//HStak funciona como ZStack, mas empilhando as views horizontalmente
