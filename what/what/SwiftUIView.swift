//
//  SwiftUIView.swift
//  what
//
//  Created by Melanie Laveriano on 2/11/25.
//

import SwiftUI

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let imageOne : String
    let imageTwo: String
    let imageThree: String
}

struct FlipCard: View {
    let restaurant: Restaurant
    @State private var isFlipped = false
    var body: some View {
        ZStack {
            frontView
                .opacity(isFlipped ? 0 : 1)
                .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
            
            backView
                .opacity(isFlipped ? 1 : 0)
                .rotation3DEffect(.degrees(isFlipped ? 0 : -180), axis: (x: 0, y: 1, z: 0))
        }
        .onTapGesture {
            withAnimation(.spring(duration: 0.5)) {
                isFlipped.toggle()
            }
        }
    }

    private var frontView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(radius: 4)
            
            VStack {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
                    .clipped()
                
                Text(restaurant.name)
                    .font(.headline)
                    .padding(.vertical)
            }
        }
    }

    private var backView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(radius: 4)
            
            VStack {
                Text("About")
                    .font(.headline)
                    .padding(.top)
                
                Text(restaurant.description)
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                HStack{
                    Image(restaurant.imageOne)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(restaurant.imageTwo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(restaurant.imageThree)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
                Spacer()
                Text("Tap to flip back")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom)
            }
        }
    }
}

struct SwiftUIView: View {
    let restaurants = [
        Restaurant(name: "Dolores Huerta", image: "DH", description: "One of the most renowned civil rights activists and prominent union activists in history, Dolores Huerta co-founded the United Farm Workers Association with Cesar Chavez.",imageOne: "DHO", imageTwo: "DHT", imageThree: "DHTH"),
        Restaurant(name: "Bessie Coleman", image: "BC", description: "Bessie Coleman was the first African-American woman and first Black person in general to receive a pilot's license.", imageOne: "BCO", imageTwo: "BCT", imageThree: "BCTH"),
        Restaurant(name: "Sally Ride", image: "SR", description: "The first American woman and the third woman ever to go to space, flying on the Challenger in 1983, Ride was also the first known LGBTQ+ astronaut.",imageOne: "SRO", imageTwo: "SRT", imageThree: "SRTH"),
        Restaurant(name: "Shirley Chisholm", image: "SC", description: "The first Black woman to serve in Congress in 1968, Chisholm (nicknamed Fighting Shirley) was also the first Black person and the first woman to run for U.S. president.",imageOne: "SCO", imageTwo: "SCT", imageThree: "SCTH"),
        Restaurant(name: "Ida B. Wells", image: "IB", description: "Born as an enslaved person, Wells was a civil rights leader and one of the founders of the NAACP.",imageOne: "IBO", imageTwo: "IBT", imageThree: "IBTH"),
    
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 300), spacing: 26)
            ], spacing: 36) {
                ForEach(restaurants) { restaurant in
                    FlipCard(restaurant: restaurant)
                        .frame(height: 360)
                }
            }
            .padding()
        }
    }
}

#Preview {
    SwiftUIView()
}
