//
//  ContentView.swift
//  Bruhpart2
//
//  Created by Melanie Laveriano on 1/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        Text("You are envited to Ms. Anitgua ceremony. We celebrate her award for best teacher!")
            .frame(width: 200)
            .font(.system(.headline))
            .fontWeight(.heavy)
            .multilineTextAlignment(.center)
        Image("Antigua")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .clipShape(.ellipse)
    }
}

#Preview {
    ContentView()
}
