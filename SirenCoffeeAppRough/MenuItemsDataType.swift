//
//  Untitled.swift
//  SirenCoffeeAppRough
//
//  Created by Caria Taylor on 9/24/26.
//

import Foundation

//Making var inside the MenuItems data type. To refrence late on in the code.



struct MenuItems :Hashable{
    var name: String
    var assetName: String
    var size: Size = .S
    var milk: Milk = .Dairy
    var syrups: Int = 0
    var withstraw: Bool = false
    var specialRequest: String? 
    
    func caculatePrice() -> Double { //" Method is another word for func."
        var price = size.basePrice // Price changes depending on the size and milk opt.
        let taxRate = 0.08
        
        
        if milk == .Oat {
            price += 0.05
        }
        if milk == .Almond {
            price += 0.05
        }
        return price + (price * taxRate) 
    }
}
