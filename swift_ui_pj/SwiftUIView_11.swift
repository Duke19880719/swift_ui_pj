//
//  SwiftUIView_11.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/6.
//

import SwiftUI

struct SwiftUIView_11: View {
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
    

    
    init(){
        
        let nav_bar_Appearance = UINavigationBarAppearance()
        nav_bar_Appearance.configureWithOpaqueBackground()   //重置背景和陰影顏色
        nav_bar_Appearance.backgroundEffect = nil
        nav_bar_Appearance.titleTextAttributes = [
                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25 ),
                     NSAttributedString.Key.foregroundColor: UIColor.clear
             ]
        nav_bar_Appearance.backgroundColor = UIColor.clear //設置導航背景色
        nav_bar_Appearance.shadowColor = nil
        UINavigationBar.appearance().scrollEdgeAppearance = nil   //scroll滑動的頁面
        UINavigationBar.appearance().standardAppearance = nav_bar_Appearance
      
//  設置 客製化 返回圖示和顏色
//        nav_bar_Appearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
//        UINavigationBar.appearance().tintColor = .systemPurple

    }
    

    
   @State var select_restaurant:restaurant?
    
    var body: some View {
        //sheet 第一種寫法
        NavigationView{
            
            List(restaurant_array.indices){ index in

                    ZStack(alignment: .leading){
                        
                        ListView2(restaurant_obj: restaurant_array[index] )
                        .onTapGesture {
                            

                            select_restaurant = restaurant_array[index]
                        }
                     
                    }
            }.navigationBarTitle("Restaurants")

                .sheet(item: self.$select_restaurant){ restaurant_data in
                    restaurant_detail_view2(restaurant: restaurant_data)
                }
        }
            
        
    }
}

struct restaurant_detail_view2: View{
    
    var restaurant:restaurant
    
    @Environment(\.presentationMode) var mode
    
    var body: some View{
        
        ScrollView{
            VStack{
                Image(restaurant.img_name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.all)
               
                
                Text(restaurant.restaurant_name).font(.title).bold().foregroundColor(.primary)
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
                    Text("From about 10 days ago office parties started to get cancelled [because of Omicron]. Going forward after yesterday's announcement that is only going to accelerate, he told the BBC's Today programme.\nWhat government has got to appreciate is for businesses, particularly in our sector, Christmas is always a key time.")
                        .font(.system(size: 15)).bold().foregroundColor(.secondary).padding()
            }
        }.overlay(
            
            HStack{
                Spacer()
                
                VStack{
                    Button {
                        self.mode.wrappedValue.dismiss()
                        
                    } label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color(UIColor.init(red: 235/255, green: 195/255, blue: 50/255, alpha: 1)))
                
                    }.padding(.trailing,20)
                        .padding(.top,40)
                    
                    Spacer()
                    
                }
                
            }
        
        )
        
    }
}

struct SwiftUIView_11_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_11()
    }
}
