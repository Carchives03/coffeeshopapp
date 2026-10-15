//
//  OrderConfirmationView.swift
//  SirenCoffeeAppRough
//
//  Created by Caria Taylor on 9/29/26.
//


import SwiftUI
struct OrderConfirmationView: View {
    
    // Creating Constant variables repeatidly.
    
    let menuitems: MenuItems
    let customerName: String
    var body: some View {
        ZStack {
           
            Color.sirenred
                .ignoresSafeArea()
            VStack{
                Text("Order Recived")
                    .offset(x: 0)
                    .offset(y: 20)
                    .font(.custom("Tilda-Grande",size: 55))
                    .foregroundStyle(.sirenwhite)
                
                
                VStack {
                    
                   // Sting interpolation so that the information isn't static.
                    Text ("Order For: \(customerName)")
                        .font(.custom("OfficeTimesSharp-RegularMono",size: 16))
                    Text(" Size: \(menuitems.size.rawValue) ")
                    Text(" Milk opt: \(menuitems.milk.rawValue)")
                 
                    if let specialRequest = menuitems.specialRequest {
                        Text("Special Request:\(specialRequest)")
                        
                        
                        
                    }
                    Text("Price: $\(menuitems.caculatePrice(),specifier: "%.2f" )")
                        .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                    
                    
                } .padding(.horizontal, 60)
                    .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                    .foregroundStyle((.black))
                    .frame(width: 300, height: 350)
                    .background(.sirenwhite)
                    .cornerRadius(30)
                
                
            }
            
        }
    }
    
}


#Preview {
    OrderConfirmationView(menuitems: MenuItems(name: "Iced Latte", assetName: "IcedLatte"), customerName: "Taylor ")
}

