//
//  ContentView.swift
//  ScrollView
//
//  Created by Melanie Laveriano on 1/21/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Your mom")
                .font(.headline)
                .foregroundColor(.secondary)
            Text("Your mom")
                .font(.title)
                .fontWeight(.black)
        }
        ScrollView{
            VStack {
                CardView(one: "swiftui-button", text: "buddy boi", subtext: "shama", author: "shush")
                CardView(one: "flutter-app", text: "buddy boi", subtext: "whats up homie", author: "mew")
                CardView(one: "macos-programming", text: "cry", subtext: "sleep", author: "repeat")
                CardView(one: "natural-language-api", text: "womp", subtext: "womp", author: "womp")
                
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
