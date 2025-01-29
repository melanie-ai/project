//
//  CardView.swift
//  ScrollView
//
//  Created by Melanie Laveriano on 1/21/25.
//

import SwiftUI
//
//  CardView.swift
//  do now
//
//  Created by Melanie Laveriano on 1/21/25.
//



struct CardView: View {
  
    var one: String
    var text: String
    var subtext: String
    var author: String

    var body: some View {

    VStack {
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
                Text(author.uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .padding()
    }
    .cornerRadius(10)
    .overlay(
    RoundedRectangle(cornerRadius: 10)
    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255,
    opacity: 0.1), lineWidth: 1)
    )
    .padding([.top, .horizontal])
    }
}



#Preview {
    CardView(one: "swiftui-button", text: "buddy boi", subtext: "shama", author: "shush")

}
