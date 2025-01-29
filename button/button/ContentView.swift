//
//  ContentView.swift
//  button
//
//  Created by Melanie Laveriano on 1/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button{
            print("Delete Tapped!")
        } label:{
            Label(
                title: {
                    Text("Delete")
                        .fontWeight(.semibold)
                        .font(.title)
                },
                icon: {
                    Image(systemName: "trash")
                        .font(.title)
                }
            )
            .frame(minWidth: 0, maxWidth: . infinity)
            .padding()
            .foregroundStyle(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color("DarkGreen"), Color("LightGreen")]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
        }
    }
}

#Preview {
    ContentView()
}
