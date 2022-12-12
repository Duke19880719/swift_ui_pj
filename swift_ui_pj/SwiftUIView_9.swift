//
//  SwiftUIView_9.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/1.
//

import SwiftUI


struct SwiftUIView_9: View {
    
    var restaurant_array = [
         restaurant(restaurant_name: "Barrafina", img_name: "barrafina")
        ,restaurant(restaurant_name: "Bourke Street Bakery", img_name: "bourkestreetbakery")
        ,restaurant(restaurant_name: "Cafe Deadend", img_name: "cafedeadend")
        ,restaurant(restaurant_name: "Cafe loisl", img_name: "cafeloisl")
        ,restaurant(restaurant_name: "Cask pub Kitchen", img_name: "caskpubkitchen")
        ,restaurant(restaurant_name: "Confessional", img_name: "confessional")
        ,restaurant(restaurant_name: "Donostia", img_name: "donostia")
        ,restaurant(restaurant_name: "Five Leaves", img_name: "fiveleaves")
        ,restaurant(restaurant_name: "Forkee Restaurant", img_name: "forkeerestaurant")
        ,restaurant(restaurant_name: "Grah Avenue meats", img_name: "grahamavenuemeats")
        ,restaurant(restaurant_name: "Cafe Lore", img_name: "cafelore")
        
    ]
    

    var body: some View {

        List(restaurant_array.indices){ restaurant_index in
                
            if (0...1).contains(restaurant_index){
                ListView1(restaurant_obj: restaurant_array[restaurant_index])
            }
            if (2...3).contains(restaurant_index){
                ListView3(restaurant_obj: restaurant_array[restaurant_index])
            }
                    
            if (4...10).contains(restaurant_index){
                ListView2(restaurant_obj: restaurant_array[restaurant_index])
            }
                    
        }
        
    }
}
struct restaurant: Identifiable{
    var restaurant_name:String
    var img_name:String
    var id = UUID()
}


struct SwiftUIView_9_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_9()
    }
}

struct ListView1: View {
    var restaurant_obj:restaurant
    
    var body: some View {
        ZStack{
            Image(restaurant_obj.img_name)
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay{
                    Rectangle()
                        .foregroundColor(Color.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                }
            Text(restaurant_obj.restaurant_name)
                .font(.system(size: 30, weight: .black, design: .rounded))
                .foregroundColor(Color.white)
        }
    }
}

struct ListView2: View {
    var restaurant_obj:restaurant
    
    var body: some View {
        HStack{
            Image(restaurant_obj.img_name)
                .resizable()
                .frame(width: 100, height: 60)
                .cornerRadius(10)
   
            Text(restaurant_obj.restaurant_name)
        }
    }
}

struct ListView3: View {
    var restaurant_obj:restaurant
    
    var body: some View {
        VStack{
            Image(restaurant_obj.img_name)
                .resizable()
                .frame( height: 150)
                .cornerRadius(10)
            Text(restaurant_obj.restaurant_name).font(.title).bold().foregroundColor(.primary)
            Text("By R.O.C ").font(.caption).bold().foregroundColor(.secondary)
            HStack{
          
                ForEach(0 ..< 5){ index in
                    Image(systemName: "star")
                        .foregroundColor(Color.yellow)
                        .overlay{
                            if(0..<4).contains(index){
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                            }
                            
                        }
                }
            }
            Text("From about 10 days ago office parties started to get cancelled [because of Omicron]. Going forward after yesterday's announcement that is only going to accelerate, he told the BBC's Today programme.\nWhat government has got to appreciate is for businesses, particularly in our sector, Christmas is always a key time.\nThe City Pub Company makes about a third of its annual profits in December, which tides it over in the quiet months of January and February.")
                .font(.caption2).bold().foregroundColor(.secondary)
            
        }
    }
}

