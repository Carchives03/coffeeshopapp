//
//  SirenMenueView.swift
//  SirenCoffeeAppRough
//
//  Created by Caria Taylor on 9/24/26.
//

import SwiftUI

struct SirenMenuView: View {
    var menuItems: MenuItems
    
    var body: some View {
        ZStack {
            Color.sirenwhite  // Background color for home screen.
                .ignoresSafeArea() // Makes App background Wider.
            VStack {
                Image(menuItems.assetName)
                    .resizable()  // Tells the code the image can be resized.
                    .scaledToFit()
                    .cornerRadius(20) // Changes the Raduis of the image.
                    .padding(20)
                    .background((.sirenred))
                    .cornerRadius(25) // Changes the radius around the border.
                
                Text(menuItems.name)
                    //.font(.custom("Adine Kirnberg",size:20))
                    .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                    .foregroundStyle((.sirenred)) // Font text.
                
            }
        }
    }
}



#Preview {
    SirenMenuView(menuItems: MenuItems(name: "Iced Latte", assetName: "IcedLatte"))
    
    
    
}
