//

//  Exercise2.swift

//  Binding and State

//

//  Created by Lisette Antigua on 2/2/25.

//



import SwiftUI



struct Exercise2: View {

    

    @State var counter = 0
    @State var counter1 = 0
    @State var counter2 = 0

    var body: some View {

        

        Text("\(counter+counter1+counter2)")

            .font(.system(size: 100))

        

        HStack{

            

            CounterButton(counter: $counter, color: .red)

            CounterButton(counter: $counter1, color: .green)

            CounterButton(counter: $counter2, color: .blue)





            

           

        }

    }

}



#Preview {

    Exercise2()

}



struct CounterButton: View {

    
   
    @Binding var counter:Int
   

    var color: Color

    var body: some View {

        Button{

            counter += 1

        }

        label:{

            Circle()

                .foregroundStyle(color)

                .overlay(

                    Text("\(counter)")

                        .foregroundStyle(.white)

                        .font(.system(size: 30, design: .rounded))

                )

        }

    }

}
