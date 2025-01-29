//
//  ContentView.swift
//  bruh
//
//  Created by Melanie Laveriano on 1/2/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Your time is limited, so don't waste it living someone else's life")
            .fontWeight(.bold)
            .font(.custom("RubikVinyl", size: 25))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .lineSpacing(10)
            .padding()
            .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
        
    }
    
}
    #Preview {
        ContentView()
    }
