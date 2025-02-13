//
//  excersie 1.swift
//  excersie
//
//  Created by Melanie Laveriano on 2/4/25.
//

import SwiftUI



struct Exercise1: View {

    @State var counter:Int = 0

    var body: some View {

        HStack {

            Button{

               counter += 1

            }

            label:{

                Circle()

                    .foregroundStyle(.red)

                    .overlay(

                        Text("\(counter)")

                            .foregroundStyle(.white)

                            .font(.system(size: 100, design: .rounded))

                    )

            }

        }

    }

}

#Preview {

    Exercise1()

}
