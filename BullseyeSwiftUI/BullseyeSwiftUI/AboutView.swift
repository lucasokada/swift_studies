//
//  AboutView.swift
//  BullseyeSwiftUI
//
//  Created by Lucas Eiki Okada on 31/05/21.
//

import SwiftUI

struct AboutHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .foregroundColor(.black)
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}

struct AboutBodyStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .foregroundColor(.black)
            .padding(.leading, 60)
            .padding(.trailing, 60)
            .padding(.bottom, 20)
    }
}

struct AboutView: View {
    let beige = Color(red: 1.0, green: 0.84, blue: 0.70)
    
    var body: some View {
        Group {
            VStack {
                Text("Bullseye").modifier(AboutHeadingStyle())
                Text("This is Bullseye, the game where you can win points and earn frame by dragging a slider")
                    .modifier(AboutHeadingStyle())
                    .lineLimit(nil)
                
                Text("My implamentation of Bullseye in SwiftUI")
                    .modifier(AboutBodyStyle())
                    .lineLimit(nil)
                
                Text("Lucas - 2021").modifier(AboutBodyStyle())
            }
            .background(beige)
        }
        .background(Image("Wallpeaper"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
