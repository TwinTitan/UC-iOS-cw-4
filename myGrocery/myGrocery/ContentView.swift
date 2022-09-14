//
//  ContentView.swift
//  myGrocery
//
//  Created by Abdallah Alshemeri on 12/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var name = ""
    @State var Items = ["RedBull", "Juice", "Pepsi", "Mars", "Chips"]
    @State var SelectedItemIndex = 0
    var body: some View {
        VStack{
            List(Items, id: \.self){ Item in
                Button(action: {
                    SelectedItemIndex = Items.firstIndex(of: Item) ?? 0
                }) {
                    HStack{
                        Image(Item)
                            .resizable()
                            .frame(width:15, height: 30)
                        Text(Item)
                            .font(.title2)
                    }

                }
            }
                HStack{
                    
                    Button(action: {
                        if !name.isEmpty{
                        Items.append(name)
                        }
                
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 40)
                            .background(.blue)
                            .clipShape(Circle())
                            .padding(.leading)

                    }
                    TextField("Item Name", text: $name)
                    
                    Button(action: {
                        if !Items.isEmpty{
                            Items.remove(at:SelectedItemIndex)
                        }
                        
                
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 40)
                            .background(.red)
                            .clipShape(Circle())
                            .padding(.leading)
                    }
                    Button(action: {
                        Items.append(Items.randomElement() ?? "")
                
                    }) {
                        Image(systemName: "questionmark")
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 40)
                            .background(.yellow)
                            .clipShape(Circle())
                            .padding(.trailing)
                    }
                    
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
