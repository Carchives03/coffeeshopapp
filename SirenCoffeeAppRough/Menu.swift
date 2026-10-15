//
//  ContentView.swift
//  SirenCoffeeAppRough
//
//  Created by Caria Taylor on 9/22/26.
//  Notes on Coding via Apple Academy.
/* Notes on coding coffe app
  - Declare weather your line of code is a constant/variable.
    Name it. Declare the data type. Create the value of your constant or variable.
  - Data type: String, Bool, int, Doubles.
  - Variables (Var) are stored values that change. Constants (let) are variables that do change.
 -// Option ("Click") lets you see libary and defination of a line of code.
*/


import SwiftUI

struct Menu: View {
    
    // Making an array of MenueItems name and image.
    let menuItems: [MenuItems] = [MenuItems (name: "Iced Latte", assetName: "IcedLatte"), MenuItems(name: "Hot Latte", assetName: "Hot Latte"), MenuItems(name: "Matcha Latte", assetName: "Matcha Latte")]
    
    let menuItems2: [MenuItems] = [MenuItems(name: "Iced Matcha Latte", assetName: "iced matcha"), MenuItems(name: "Iced Cherry Latte", assetName: "cherry latte"), MenuItems(name: "Chai Latte", assetName: "chai latte")]
   
    
    
    var body: some View {
        TabView {
            // Navigation link wont work without navigation stack.
            NavigationStack{
                //Creating background for app inside seperate Zstack.
                
                ZStack {
                    Color.sirenwhite
                        .ignoresSafeArea()
                    VStack{
                        Text("Siren Café Menu") // Menu Label
                            .offset(x: 0)
                            .offset(y: 60)
                            .font(.custom("Tilda-Grande",size: 40))
                            .foregroundStyle(.sirenred)
                        
                        // To make two rows I made two scrollveiws connceted to a Vstack & Hstack. Both are still inside of the same Naigation stack, Zstack, Vstack.
                        
                        
                        ScrollView(.horizontal){
                            VStack {
                                
                                
                                
                                HStack {
                                    //Loops through menuItems array and selects unique asset/name */
                                    ForEach(menuItems, id:\.self) {Menuitems in
                                        // Link to customizationviewpage.
                                        NavigationLink{
                                            CustomizationView(menuItems: Menuitems)
                                            //Use SirenMenuView struct.
                                        } label: {SirenMenuView(menuItems: Menuitems)
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                
                                
                            }
                            .padding(.top, 70)
                        }
                        ScrollView(.horizontal){
                            VStack{
                                HStack {
                                    ForEach(menuItems2, id:\.self) {Menuitems in
                                        // Link to customizationviewpage.
                                        NavigationLink{
                                            CustomizationView(menuItems: Menuitems)
                                            //Use SirenMenuView struct.
                                        } label: {SirenMenuView(menuItems: Menuitems)
                                            
                                        }
                                        
                                    }
                                    
                                    
                                }
                                
                            }
                        }
                        .padding(.bottom, 70)
                    }
                }
                
            }
            
        
        
           //Tabview Code, each tab has a lable, a system image, and navigation stack.
            .tabItem{
                Label ("Menu", systemImage: "cup.and.saucer")
                
            }
            
            // Custom Tab
            NavigationStack {
                CustomizationView(menuItems: menuItems[0])
            }
            
            .tabItem{
                Label ("Customize", systemImage: "heart")
            }
            
            // Order Tab
            NavigationStack {
                OrderConfirmationView(menuitems: MenuItems(name: " ", assetName: " "), customerName: " ")
           
            }
            .tabItem{
                Label("Order", systemImage: "bag")
                
            }
            
        } .tint(.sirenred)
          
    }

    }


       
    


#Preview {
    Menu()
}

