import UIKit

protocol Message {
    var messageString: String { get set }
    init(messageString: String)
    func prepareMessage()
}

protocol Sender {
    var message: Message? { get set }
    func sendMessage(message: Message) /*** protocolo message tem uma unica propriedade messageString
     do tipo setring que nao pode ser nil***/
    
    //suponha que algum dia, no futuro, um requerimento de uma funcionalidade para verificar a mensagem
    //antes de ser enviada seja feito. Basta adicioná-la ao protocolo
    
    func verifyMessage()
}

class PlainTextMessage: Message {
    var messageString: String
    
    required init(messageString: String) {
        self.messageString = messageString
    }
    
    func prepareMessage() {

    }
}

class DesencryptedMessage: Message {
    var messageString: String
    
    required init(messageString: String) {
        self.messageString = messageString
    }
    
    func prepareMessage() {
        self.messageString = "DES:" + self.messageString
    }
}

class EmailSender: Sender {
    var message: Message?
    
    func verifyMessage() {
        print("Verifying Email message")
    }
    
    func sendMessage(message: Message) {
        print("Sending through email:")
        print("\(message.messageString)")
    }
}

class SMSSender: Sender {
    var message: Message?
    
    func verifyMessage() {
        print("Veryifing SMS message")
    }
    
    func sendMessage(message: Message) {
        print("Sending through SMS:")
        print("\(message.messageString)")
    }
}

var myMessage = PlainTextMessage(messageString: "my message")
myMessage.prepareMessage()
var sender = SMSSender()
sender.message = myMessage
sender.verifyMessage()
sender.sendMessage(message: myMessage)
