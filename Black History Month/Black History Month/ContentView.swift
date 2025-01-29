//
//  ContentView.swift
//  Black History Month
//
//  Created by Melanie Laveriano on 1/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            kms()
                .tabItem{
                    Label("Figures", systemImage: "person.fill")
                }
            kms2()
                .tabItem{
                    Label("Movements", systemImage: "square.and.arrow.down")
                }
            kms3()
                .tabItem{
                    Label("Culture", systemImage: "square.and.arrow.up")
                }

        }
    }
}

#Preview {
    ContentView()
}
