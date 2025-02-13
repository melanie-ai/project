//
//  kms3.swift
//  Black History Month
//
//  Created by Melanie Laveriano on 1/23/25.
//

import SwiftUI

struct kms3: View {
    var body: some View {
        ScrollView{
            cardView(one: "Aretha", text: "Aretha Louise Franklin was an American singer, songwriter, pianist, and civil rights activist. She was known as the Queen of Soul and was twice named by Rolling Stone magazine as the greatest singer of all time. Franklin was the first woman inducted into the Rock and Roll Hall of Fame in 1987.", subtext: "Aretha Franklin")
            cardView(one: "Ella", text: "Ella Jane Fitzgerald was an American jazz singer and composer who reigned as the most popular female jazz singer in the US for over 50 years.", subtext: "Ella Fitzgerald")
            cardView(one: "Prince", text: "Prince Rogers Nelson was an American singer, songwriter, musician, producer, dancer, and inventor who rose to international fame in the 1980s. A prolific and versatile artist, he was known for his virtuosic vocals, androgenous stage presence, and multi-instrumental skills.", subtext: "Prince")
        }
        
    }
}
struct cardView: View{
    var one: String
    var text: String
    var subtext: String
    
    var body: some View {
        VStack{
            Image(one)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment: .leading){
                    Text(text)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(subtext)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
                              opacity: 1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
    
}
#Preview {
    kms3()
    
}
