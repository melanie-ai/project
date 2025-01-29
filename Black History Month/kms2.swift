//
//  kms2.swift
//  Black History Month
//
//  Created by Melanie Laveriano on 1/23/25.
//

import SwiftUI

struct kms2: View {
    var body: some View {
        Text("Movement")
            .multilineTextAlignment(.leading)
            .font(.title)
            .fontWeight(.black)
        ScrollView{
            ardView(one: "Wash", text: "The march gave hope to many Americans that civil rights issues would be addressed. The march was a collaborative effort between civil rights, labor, and religious organizations, as well as student groups.", subtext: "Washington March")
            ardView(one: "Riders", text: "Freedom Riders were civil rights activists who rode buses into the segregated Southern United States in 1961 to challenge segregation laws", subtext: "Freedom Riders")
            ardView(one: "BLM", text: "BLM marches demand racial justice, liberation, and freedom from discrimination and violence.BLM marches condemn the unjust killings of Black people by police.BLM marches demand that society value Black people's lives and humanity as much as it values white people's lives and humanity.", subtext: "Black Lives Matter")
        }
        
    }
}
struct ardView: View{
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
    kms2()
}
