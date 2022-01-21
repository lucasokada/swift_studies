//
//  ContentView.swift
//  BullseyeSwiftUI
//
//  Created by Lucas Eiki Okada on 27/05/21.
//

import SwiftUI

struct LabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(.white)
            .modifier(Shadow())
    }
}

struct ValueStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(.green)
            .modifier(Shadow())
    }
}

struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(color: .black, radius: 5, x: 2, y: 2)
    }
}

struct ButtonLargeTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(.white)
    }
}

struct ButtonSmallTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
            .foregroundColor(.white)
    }
}


struct ContentView: View {
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1 ... 100)
    var sliderValueRounded: Int {
        Int(self.sliderValue.rounded())
    }
    
    @State var score = 0
    @State var round = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                HStack {
                    Text("Put the bullseye as close as you can to:")
                        .modifier(LabelStyle())
                        
                    Text("\(self.target)")
                        .modifier(ValueStyle())
                }
                
                Spacer()
                
                HStack {
                    Text("1").modifier(LabelStyle())
                    
                    Slider(value: self.$sliderValue, in: 1 ... 100)
                        .accentColor(Color(red: 0, green: 255, blue: 255))
                    
                    Text("100").modifier(LabelStyle())
                }
                
                Spacer()
                
                Button(action: {
                    print("Points awarded: \(self.pointsForCurrentRound())")
                    self.alertIsVisible = true
                }) {
                    Text("Hit me!")
                        .modifier(LabelStyle())
                        .alert(isPresented: self.$alertIsVisible) {
                            Alert(title: Text(self.alertTitle()),
                                  message: Text(self.scoringMessage()),
                                  dismissButton: .default(Text("Awesome!")) {
                                    self.startNewRound()
                            })
                        }
                }
                .background(Image("Button-Normal"))
                .modifier(ButtonLargeTextStyle())
                .modifier(Shadow())
                
                Spacer()
                
                HStack {
                    Button(action: {
                        self.startNewGame()
                    }) {
                        HStack {
                            Image("StartOver-Button")
                            Text("Start over")
                                .modifier(ButtonSmallTextStyle())
                        }
                    }
                    .background(Image("Button-Normal"))
                    .modifier(Shadow())
                    
                    Spacer()
                    
                    Text("Score:").modifier(LabelStyle())
                    Text("\(self.score)").modifier(ValueStyle())
                    
                    Spacer()
                    
                    Text("Round:").modifier(LabelStyle())
                    Text("\(self.round)").modifier(ValueStyle())
                    
                    Spacer()
                    
                    NavigationLink(destination: AboutView()) {
                        HStack {
                            Text(Image.init(systemName: "info.circle"))
                            Text("Info").modifier(ButtonSmallTextStyle())
                        }
                    }
                }
                .padding(.bottom, 20)
                .accentColor(.blue)
                    
            }.background(Image("Wallpeaper"))
            
        }
        .onAppear() {
            self.startNewGame()
        }
        .background(Image("Wallpeaper"))
    }
    
    func scoringMessage() -> String {
        return "The slider value is \(self.sliderValueRounded)\n" + "The target value is \(self.target)\n" + "You scored \(self.pointsForCurrentRound()) points\n"
    }
    
    func alertTitle() -> String {
        let difference = abs(self.sliderValueRounded - self.target)
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        }else if difference < 5 {
            title = "You almost had it!"
        }else if difference < 10 {
            title = "Not bad."
        }else {
            title = "Are you even trying?"
        }
        
        return title
    }
    
    func pointsForCurrentRound() -> Int {
        let maximumScore = 100
        let difference = abs(self.sliderValueRounded - self.target)
        
        let points: Int
        if difference == 0 {
            points = 200
        } else if difference == 1 {
            points = 150
        } else {
            points = maximumScore - difference
        }
        
        return points
    }
    
    func resetSliderAndTarget() {
        self.sliderValue = 50
        self.target = Int.random(in: 1 ... 100)
    }
    
    func startNewGame() {
        self.score = 0
        self.round = 1
        self.resetSliderAndTarget()
    }
    
    func startNewRound() {
        self.score += self.pointsForCurrentRound()
        self.round += 1
        self.resetSliderAndTarget()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
