//
//  ContentView.swift
//  stack
//
//  Created by Melanie Laveriano on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            HStack {
                Pricingview(title: "Basic", price: "$9", textColor: .white, bgColor: .purple)
                ZStack{
                    Pricingview(title: "Pro", price: "$19", textColor: .black, bgColor: Color(red: 240/255, green: 240/255, blue: 240/255))
                    Text("Best for designer")
                        .font(.system(.caption, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                        .offset(x: 0, y: 87)
                    
                }
                
                
                
            }
            
            
            ZStack{
                Pricingview(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue:70/255), icon: "wand.and.rays")
                Text("Perfect for team with 20 members")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .offset(x: 0, y: 110)
            }
            Spacer()
            
        }
    }
       // ZStack{
           // PricingView(title: "Team", price: "$299", textColor: .white, bgColor: Color(red: 62/255, green: 63/255, blue:70/255), icon: "wand.and.rays")
           // Text("Perfect for team with 20 members")
               // .font(.system(.caption, design: .rounded))
            // .fontWeight(.bold)
                //.foregroundColor(.white)
                //.padding(5)
            // .background(Color(red: 255/255, green: 183/255, blue: 37/255))
               // .offset(x: 0, y: 110)
       // }
        //Spacer()
}

#Preview {
    ContentView()
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 2){
            Text("Choose")
                .font(.system(.largeTitle, design: . rounded))
                .fontWeight(.black)
            Text("Your Plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
    }
}

struct Pricingview: View {
    var title: String
    var price: String
    var textColor: Color
    var bgColor: Color
    var icon: String?
    
    var body: some View {
        VStack{
            if let icon = icon{
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(textColor)
            }
            Text(title)
                .font(.system(.title, design: . rounded))
                .fontWeight(.black)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 40, weight: .heavy, design: . rounded))
                .foregroundColor(textColor)
            Text("per month")
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
        .padding(40)
        .background(bgColor)
        .cornerRadius(10)
    }
}
