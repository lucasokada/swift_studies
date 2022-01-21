//: # Aprendendo Swift
//:
//:Um grupo de biólogos está pesquisando uma determinada espécie de 
//: bactérias. Elas são caracterizadas por se multiplicarem nas 
//: direções vertical e horizontal sempre que houver espaço 
//: disponível. Com o objetivo de prever experimentos, os biólogos 
//: desejam implementar um programa para calcular quanto tempo uma 
//: dada colônia de bactérias leva para se alastrar sobre alguns 
//: pontos de controle. Para isso, a entrada do programa será uma 
//: foto microscópica da colônia dividida em quadrantes. Existem três 
//: tipos possíveis de regiões:
//:
//: - 👾 - Regiões já ocupadas por bactérias;
//: - 🚩 - Regiões onde se localizam os pontos de controle;
//: - 🍞 - Quaisquer outras regiões.
//:
//: A cada segundo, cada bactéria se multiplica, se houver espaço, 
//: para duas regiões na horizontal (uma para direita e uma para 
//: esquerda) e duas regiões na vertical (uma acima e uma abaixo). 
//: No exemplo abaixo vemos a esquerda a formaçao inicial de uma
//: colônia e nas imagens seguintes sua evolução nos 2 segundos
//: posteriores:

//: ![Colônia](Colony.png)

//: Escreva um código em Swift para calcular quantos segundos são 
//: necessários para que o primeiro ponto de controle seja atingido e 
//: para que todos os pontos sejam atingidos.
//:
//: **Dicas**:
//: - Você deve implementar a função **execute** que recebe um array 
//: de Strings contendo em cada elemento umas das linhas da matriz da 
//: área de teste. Esta função retorna um dado do tipo **Output** com 
//: dois parâmetros: o tempo de atinghimento do primeiro ponto de 
//: controle e o tempo para atingir todos os pontos. Sendo assim, se
//: o primeiro ponto foi atingido em 1s e todos os outros no 5o 
//: segundo, criamos o resultado como **Output(1,5)**.
//:
//: - Você pode criar classes, atributos e funções auxiliares da forma
//: que considerar necessário para auxiliar sua resolução. É necessário
//: apenas garantir que a interface com outors trechos de código seja feita
//: pela função **execute** da classe **ColoniaDeBacterias**.
//:
//: - Use a função **print** ou os recursos do *playground* para depurar seu
//: código.


//: [Próximo](@next)
