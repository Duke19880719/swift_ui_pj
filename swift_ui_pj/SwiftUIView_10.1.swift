//
//  SwiftUIView_10.1.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/6.
//

import SwiftUI

struct SwiftUIView_10_1: View {
    
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

        nav_bar_Appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGreen ,.font: UIFont(name: "ArialRoundedMTBold", size: 35)]

        nav_bar_Appearance.titleTextAttributes = [.foregroundColor: UIColor.systemGreen ,.font: UIFont(name: "ArialRoundedMTBold", size: 25)]

        UINavigationBar.appearance().standardAppearance = nav_bar_Appearance
        UINavigationBar.appearance().scrollEdgeAppearance = nav_bar_Appearance
        UINavigationBar.appearance().compactAppearance = nav_bar_Appearance
      
//  設置 客製化 返回圖示和顏色
//        nav_bar_Appearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
//        UINavigationBar.appearance().tintColor = .systemPurple

    }
    

    var body: some View {
        
        NavigationView{
            
            List(restaurant_array.indices){ index in
                
                //列表視圖隱藏 Disclosure 指示器
                if (0...2).contains(index){
                    
                    ZStack(alignment: .leading){
                        
                        ListView2(restaurant_obj: restaurant_array[index] )
                     

                        NavigationLink(destination: restaurant_detail_view1(restaurant: restaurant_array[index] )){
                            
                            
                            EmptyView()
                        
                        }.opacity(0)
                        
                    }
                }
                //正常版
                else{
                    NavigationLink(destination: restaurant_detail_view1(restaurant: restaurant_array[index] )){

                        ListView2(restaurant_obj: restaurant_array[index] )

                    }
                }
            }
            .navigationBarTitle("Restaurants")
            
        }
            
            
        
    }
}

struct restaurant_detail_view1: View{
    
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
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            
            self.mode.wrappedValue.dismiss()
                    
        }, label: {
                    
                    Text("\(Image(systemName: "arrow.turn.up.left"))\(restaurant.restaurant_name)")
                .foregroundColor(.green).fontWeight(.heavy).font(.system(size: 20)).shadow(color: Color.black , radius: 0.3, x: 2, y: 2)
                    
        })).navigationBarTitleDisplayMode(.inline)

    }
}


struct SwiftUIView_10_1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_10_1()
    }
}
