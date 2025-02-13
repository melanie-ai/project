//
//  kms.swift
//  Black History Month
//
//  Created by Melanie Laveriano on 1/23/25.
//

import SwiftUI

struct kms: View {
    var body: some View {
        ScrollView{
            rdView(one: "Martin_Luther_King,_Jr.", text: "Martin Luther King Jr. was an American Baptist minister, activist, and political philosopher who was one of the most prominent leaders in the civil rights movement from 1955 until his assassination in 1968.", subtext: "Martin Luther King Jr.")
            rdView(one: "Malcolm", text: "Malcolm X was one of the most significant figures within the American Black nationalist movement. Many of the ideas he articulated, like race pride and self-defense, became ideological mainstays of the Black Power movement that emerged in the 1960s and '70s.", subtext: "Malcolm X")
            rdView(one: "Parks", text: "Rosa Louise McCauley Parks was an American activist in the civil rights movement, best known for her pivotal role in the Montgomery bus boycott.", subtext: "Rosa Parks")
            rdView(one: "Katherine", text: "Creola Katherine Johnson was an African American mathematician and NASA researcher who played a vital role in the success of the first US crewed spaceflights. Her orbital mechanics calculations were crucial for sending the first American astronaut into orbit and landing astronauts on the moon.", subtext: "Katherine Johnson")
        }
        
    }
}
struct rdView: View{
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
                        .lineLimit(4)
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
    kms()
}
