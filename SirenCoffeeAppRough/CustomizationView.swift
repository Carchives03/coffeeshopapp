//
//  CustomizationView.swift
//  SirenCoffeeAppRough
//
//  Created by Caria Taylor on 9/25/26.
//

import SwiftUI
struct CustomizationView: View {
    @State var menuItems: MenuItems
    @State private var customerName: String = ""
    @State var showingSheet: Bool = false
    @State private var specialRequest: String = " "
    
   
    
    var body: some View {
        ZStack {
            Color.sirenwhite // Background color for home screen.
                .ignoresSafeArea() // Makes App background Wider.
              
            
            VStack {
                Image(menuItems.assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 200)
                    .cornerRadius(100)
                    .padding(20)
                    .background((.sirenred))
                    .cornerRadius(105)
                  Text("\(menuItems.name)") //Displaying Name from menuItenms variable.
                    .font(.custom("OfficeTimesSharp-RegularMono",size: 20))
                
                // 1st Picker.
                Text("Size Opt:")
                    .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                    .foregroundStyle(.sirenwhite)
                    .frame(width: 100, height: 20)
                    .background(.sirenred)
                    .cornerRadius(10)
                    .offset(x: -125)
                    
                   
                // Creating a For Loop for picker, so that I dont have to manually add each Size.
                Picker("Size?", selection: $menuItems.size) { // Creating Picker, then biding it to var size.
                    ForEach(Size.allCases, id: \.self){ Size in // For loop cycles through Size Enum.
                        Text("\(Size)").tag(Size) // Returns Size text.
                          
                    }
                // Picker Styling.
                } .pickerStyle(.segmented)  //Change the style of the picker.
                    .padding(5)
                 
        
             
                // 2nd Picker.
                Text("Milk Opt:")
                    .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                    .foregroundStyle(.sirenwhite)
                    .frame(width: 100, height: 20)
                    .background(.sirenred)
                    .cornerRadius(10)
                    .offset(x: -125)
                
                    
                Picker ("Milk Opt?", selection: $menuItems.milk) {
                    ForEach(Milk.allCases, id: \.self){ Milk in
                        Text("\(Milk)").tag(Milk)
                               
                    }
                    //Styleing for Picker 2.
                } .pickerStyle(.segmented)

                    .padding(5)
                
                //Stepper
                Stepper("Syrup?", value: $menuItems.syrups, in: 0...5) // Binds menuItems var to var syrups.
                .padding(.horizontal, 10)
                Text("\(menuItems.syrups)")  // String interpolation to show the real value.
                    .foregroundStyle(.sirenwhite)
                    .frame(width: 20, height: 20)
                    .background(.sirenred)
                    .cornerRadius(10)
                   
                
                // Toggle
                Toggle("Straw?",isOn: $menuItems.withstraw) // Binds menuItems var to with straw var.
                    .tint(.sirenred)
                    .padding()
                   
                // Customer Name.
                Text("Customer Name")
                    .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                    .foregroundStyle(.sirenwhite)
                    .frame(width: 150, height: 20)
                    .background(.sirenred)
                    .cornerRadius(10)
                    .offset(x: -90)
                
                // Textfield For Customer Name
                TextField("Enter Your Name", text: $customerName)
                    .padding(8)
                    .overlay(
                        
                        // Background for textfield.
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.sirenred, lineWidth: 5))
                  
                
                
                
                //Special Request Label
                Text("Special Request")
                    .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                    .foregroundStyle(.sirenwhite)
                    .frame(width: 150, height: 20)
                    .background(.sirenred)
                    .cornerRadius(10)
                    .offset(x: -90)
                
                // Textfield for special request.
                TextField("Special Request",text: $specialRequest)
                    .padding(8)
                    .overlay(
                        
                        //Background
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.sirenred, lineWidth: 5))
                
                
                // Creating button for showingSheet.
                Button("Confirm: $\(menuItems.caculatePrice(),specifier: "%.2f" )") { //Binding menuItems var to cP.
                    showingSheet = true
                    updateOrder()

                   
                }
                .padding()
                .buttonStyle(.bordered)
               
                // Adding sheet modifier.
                .sheet(isPresented: $showingSheet) {OrderConfirmationView(menuitems: menuItems, customerName: customerName)
                    
                }
                
            }  .padding(.horizontal, 30)
                .font(.custom("OfficeTimesSharp-RegularMono",size: 15))
                .foregroundStyle(.sirenred)
        
        }
    }
    func updateOrder () {
        if !specialRequest.isEmpty {
            menuItems.specialRequest = specialRequest  // Optionals for specialrequest.
        }
    }
}
    


#Preview {
    CustomizationView(menuItems: MenuItems(name: "Iced Latte", assetName: "IcedLatte"))
}
