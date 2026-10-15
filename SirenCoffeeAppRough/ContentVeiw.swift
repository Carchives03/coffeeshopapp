//
//  Homepage.swift
//  SirenCoffeeAppRough
//
//  Created by Caria Taylor on 10/1/26.
//

import SwiftUI

struct ContentVeiw: View {
    var body: some View{
        NavigationStack{
            ZStack{
                Color.sirenwhite
                    .ignoresSafeArea()
                VStack {
                    Image ("sirenlogo")
                        .resizable()
                        .scaledToFit()
                    
                    // Button Navs to Menu Page.
                    NavigationLink{
                    Menu()
                    } label: {
                        Text("Welcome")
                            .frame(width:125)
                            .padding()
                            .font(.custom("OfficeTimesSharp-RegularMono",size: 20))
                            .foregroundStyle(.sirenwhite)
                            .background(.sirenred)
                            .cornerRadius(25)
                            .accessibilityLabel("Welcome")
                            .accessibilityHint("Open the menu of coffee shop ")
                            
                        
                    }
                   
                }
            }
        }
    }
        
}


#Preview {
    ContentVeiw()
}
