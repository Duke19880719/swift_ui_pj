//
//  SwiftUIView_12.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/7.
//

import SwiftUI

struct SwiftUIView_12: View {
    
    @State var restaurant_array = [
        restaurant_struct_1(name: "Barrafina", img:"barrafina", type:"Spanish" ,phone:"0933547896",PriceLevel:1)
        ,restaurant_struct_1(name: "Bourke Street Bakery", img: "bourkestreetbakery", type: "Spanish", phone:"0933547896",PriceLevel:2)
        
        ,restaurant_struct_1(name: "Cafe Deadend", img: "cafedeadend", type: "British", phone:"0933547896",PriceLevel:3)
        ,restaurant_struct_1(name: "Cafe loisl", img: "cafeloisl", type: "French", phone:"0933547896",PriceLevel:5)
        ,restaurant_struct_1(name: "Cask pub Kitchen", img: "caskpubkitchen", type: "Thai", phone:"0933547896",PriceLevel:4)
        ,restaurant_struct_1(name: "Confessional", img: "confessional", type: "Spanish", phone:"0933547896",PriceLevel:2)
        ,restaurant_struct_1(name: "Donostia", img: "donostia", type: "Thai", phone:"0933547896",PriceLevel:1)
        ,restaurant_struct_1(name: "Five Leaves", img: "fiveleaves", type: "British", phone:"0933547896",PriceLevel:3)
        ,restaurant_struct_1(name: "Forkee Restaurant", img: "forkeerestaurant", type: "French", phone:"0933547896",PriceLevel:3)
        ,restaurant_struct_1(name: "Grah Avenue meats", img: "grahamavenuemeats", type: "Spanish", phone:"0933547896",PriceLevel:1)
        
    ]
    
    @State var check_setting:Bool = false
   
    
    private func delete(item restaurant: restaurant_struct_1) {
       if let index = restaurant_array.firstIndex(where: { $0.id == restaurant.id }) {
           restaurant_array.remove(at: index)
        
       }
   }

    private  func setFavorite(item restaurant: restaurant_struct_1) {
       if let index = restaurant_array.firstIndex(where: { $0.id == restaurant.id }) {
           restaurant_array[index].isFavorite.toggle()
       }
   }

    private func checkIn(item restaurant: restaurant_struct_1) {
        if let index = restaurant_array.firstIndex(where: { $0.id == restaurant.id }) {
            restaurant_array[index].isCheckIn.toggle()
        }
   }
    
 
    @StateObject var setting_restaurant = user_setting()
    
    private func check_restaurant(restaurant:restaurant_struct_1)-> Bool{
        
        return (!self.setting_restaurant.ShowCheckinOnly || restaurant.isCheckIn) && (restaurant.PriceLevel <= self.setting_restaurant.PriceMaxLevel)
    }
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        
    }
    
    @State var check_confirmationDialog:Bool = false
    @State var delete_restaurant:restaurant_struct_1 = restaurant_struct_1(name: "Grah Avenue meats", img: "grahamavenuemeats", type: "Spanish", phone:"0933547896",PriceLevel:1)
    
    var body: some View {
        
        NavigationView{
            
                List{
                    ForEach(restaurant_array.sorted(by: self.setting_restaurant.display_order_value.sort_method())){ restaurant_item in
                     
                        if self.check_restaurant(restaurant: restaurant_item){
                            row_view(data: restaurant_item)
                                .contextMenu{
                                    Button {
                                        checkIn(item: restaurant_item)
                         
                                    } label: {
                                        HStack {
                                            Text("Check-in")
                                            Image(systemName: "checkmark.seal.fill")
                                        }
                                    }
                                    
                                    Button {
                                        delete(item: restaurant_item)
                                    } label: {
                                        HStack {
                                            Text("Delete")
                                            Image(systemName: "trash")
                                        }
                                    }
                                    
                                    Button {
                                        setFavorite(item: restaurant_item)
                                    } label: {
                                        HStack {
                                            Text("Favorite")
                                            Image(systemName: "star")
                                        }
                                    }
                                }.onTapGesture(count: 2) {
                                    check_confirmationDialog.toggle()
                                    delete_restaurant = restaurant_item
                                    
                                }
                                .confirmationDialog("提示訊息", isPresented: $check_confirmationDialog, titleVisibility: .visible, actions: {
                                
                                    Button("是否刪除 \(delete_restaurant.name)") {
//                                        不加動畫，會有兩次畫面跳出bug
                                        
                                        withAnimation {
                                            delete(item: delete_restaurant)
                                        }
                                    }
                                })
                                
                               
                        }
                    }.onDelete { index in
                        restaurant_array.remove(atOffsets: index)
                    }

                }.navigationBarTitle("Restaurants\n")
                .toolbar {
                    Button {
                        self.check_setting = true
                    } label: {
                        Image(systemName: "gear").font(.title).foregroundColor(.black)
                    }

                }
                .sheet(isPresented: $check_setting){
                    SwiftUIView_12_frame()
                    
                }.background(Color(UIColor.systemGray5).ignoresSafeArea()).shadow(color: Color(UIColor.systemGray), radius: 1, x: 2, y: 2)

      
        }.environmentObject(setting_restaurant)
    }
}

struct row_view:View{
    var data:restaurant_struct_1
    var body: some View {
        
        HStack{
            Image(data.img).resizable().aspectRatio(contentMode: .fit).cornerRadius(100).frame( height: 60)
            VStack(alignment: .leading){
                HStack{
                    Text(data.name).foregroundColor(.primary).bold()
                    Spacer()
                    ForEach(0 ..< data.PriceLevel){ index in
                        Text("$").foregroundColor(.green).bold()

                    }
                        
                }
                Text(data.type).foregroundColor(Color(UIColor.systemGray)).bold()
                
                HStack{
                    Text(data.phone).foregroundColor(Color(UIColor.systemGray))
                    Spacer()
                    if data.isFavorite{
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.red)
                    }
                    if data.isCheckIn{
                        Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    }
                }
  
            }

        }

    }
}
struct restaurant_struct_1: Identifiable {
    
    var name:String
    var img:String
    var type:String
    var phone:String
    var PriceLevel:Int
    var id = UUID()
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
    
}


struct SwiftUIView_12_Previews: PreviewProvider {

    static var previews: some View {
        SwiftUIView_12()
    }
}
