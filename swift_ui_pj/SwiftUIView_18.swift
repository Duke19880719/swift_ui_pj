//
//  SwiftUIView_18.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/5/13.
//
//

import SwiftUI

struct SwiftUIView_18: View {
    
    init() {
//        **簡易修改TabBar 屬性
//        let appearance = UITabBarAppearance()
//        appearance.backgroundColor = UIColor(Color(#colorLiteral(red: 0.5, green: 1, blue: 0.5, alpha: 0.75)))
//
//        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
//        UITabBar.appearance().scrollEdgeAppearance = appearance

        
//        **細部修改UITabBarItemAppearance()和UITabBarAppearance()
        //修改 TabBar 中的物件，例如圖標文本等
        let itemAppearance = UITabBarItemAppearance()
                //標籤
                //圖標的顏色————也就是Image的顏色
                    //未選中的標籤的圖標的顏色
        itemAppearance.normal.iconColor = UIColor(red: 0, green: 100/255, blue: 0, alpha: 0.65)
                    //選中的標籤的圖標的顏色
        itemAppearance.selected.iconColor = UIColor(Color.pink)
                //文本的顏色————也就是Text的顏色
                //這裡只演示了修改文本顏色。除了能修改顏色之外，還能修改字體類型、大小、陰影、背景，甚至是內容。
                    //未選中的標籤的標題的顏色
        itemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(red: 0, green: 100/255, blue: 0, alpha: 0.65),.font : UIFont(name: "Georgia-Bold", size: 20)!]
                    //選中的標籤的標題的顏色
        itemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color.pink)]
                
                //氣泡
                //需要注意的是，如果只設置了 normal 或者 selected 狀態下的值，那麼不論狀態是什麼，都用這個值！
                //背景颜色
                    //未選中的標籤的氣泡的背景顏色
//                    itemAppearance.normal.badgeBackgroundColor = UIColor(Color.black)
                    //選中的標籤的氣泡的背景顏色
//                    itemAppearance.selected.badgeBackgroundColor = UIColor(Color.yellow)
               
                    //選中的標籤的氣泡的文本顏色
                    itemAppearance.normal.badgeTextAttributes = [.foregroundColor: UIColor(Color.gray)]
                    //選中的標籤的氣泡的文本顏色
                    itemAppearance.selected.badgeTextAttributes = [.foregroundColor: UIColor(Color.black)]
                //位置
                    //未選中的標籤的氣泡的位置
//                    itemAppearance.normal.badgePositionAdjustment = UIOffset(horizontal: -10, vertical: -10)
                    //選中的標籤的氣泡的位置
//                    itemAppearance.selected.badgePositionAdjustment = UIOffset(horizontal: 10, vertical: 10)
                //標題的位置————這個偏移是疊加在氣泡的位置偏移上的，但是二者的參考系的橫軸是反的
                    //未選中的標籤的氣泡標題的位置
//                    itemAppearance.normal.badgeTitlePositionAdjustment = UIOffset(horizontal: -10, vertical: -10)
                    //選中的標籤的氣泡標題的位置
//                    itemAppearance.selected.badgeTitlePositionAdjustment = UIOffset(horizontal: 10, vertical: 10)
                    
                let appeareance = UITabBarAppearance()
                //這裡就可以將我們上面設置的 itemAppearance 應用到 UITabBarAppearance() 的 stackedLayoutAppearance 屬性中
                appeareance.stackedLayoutAppearance = itemAppearance
                //TabBar的背景圖片
//                appeareance.backgroundImage = UIImage(named: "test")
                //TabBar的背景颜色
                appeareance.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 55, alpha: 0.15)
                //TabBar的陰影，就是最上面的那條“線”
                appeareance.shadowColor = UIColor(Color.black)
                //tabItem們的擺放格式。 .automatic就是默認格式；.centered表示盡量往中間靠；.fill表示盡量填滿TabBar。
                appeareance.stackedItemPositioning = .centered
                //tabItem們的間距，不過最大的效果就是和.fill格式一樣，不會超出視圖
                appeareance.stackedItemSpacing = 2000

                //來把之前的設置全部應用到視圖中
                //使用這個會無法應用我們對 UITabBarAppearance() 的設置
        //        UITabBar.appearance().standardAppearance = appeareance
                UITabBar.appearance().scrollEdgeAppearance = appeareance
     
        
    }
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection){
            custom_view (image_name:"sun.max.fill" , content_str:"The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma,heated to incandescence by nuclear fusion reactions in its core, radiating the energy mainly as visible light, ultraviolet, and infrared radiation. ", color_value: UIColor.orange, text_color: UIColor.black )
                .tabItem {
           
                    selection == 0 ? Image(systemName: "sun.min") : Image(systemName: "sunrise")
                    Text("Sun").bold()
                        
                }.background(
                    LinearGradient(gradient: Gradient(colors: [ .blue,.white]), startPoint: .top, endPoint: .bottom)
                ).tag(0)
            
            
            custom_view (image_name:"moon.stars.fill" , content_str:"The Moon is Earth's only natural satellite. At about one-quarter the diameter of Earth,it is the fifth largest satellite in the Solar System, the largest satellite in the Solar System relative to its major planet, and larger than any known dwarf planet.", color_value: UIColor.yellow, text_color: UIColor.white )
                .tabItem {
                  
                    selection == 1 ?  Image(systemName: "moon.stars.fill") :  Image(systemName: "moon.zzz.fill")
                    Text("Moon").bold()
                        
                }.background(
                    LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                ).tag(1)
            
            tabview_pageview()
                .tabItem {
                
                    selection == 2 ? Image(systemName: "book") : Image(systemName: "text.book.closed.fill")
                    Text("Scroll").bold()
                    
                }.tag(2)
            
        }
       
    }
}

struct SwiftUIView_18_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_18()
    }
}
struct custom_view:View{
    
    var image_name:String
    var content_str:String
    var color_value:UIColor
    var text_color:UIColor
    
    var body: some View{
        VStack{
            Image(systemName:image_name )
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundColor(Color(color_value)).padding()
            
            Text("\(content_str)").foregroundColor(Color(text_color)).bold().padding(.bottom)
            
        }.padding()
    }
}

struct tabview_pageview:View{
    
    var body: some View{
        TabView{
            ZStack{
                Image("barcelona-spain")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                Text("barcelona-spain").font(.title).foregroundColor(.white).fontWeight(Font.Weight.heavy).shadow(color: Color.black, radius: 2, x: 1, y: 1)
            }
           
            ZStack{
                Image("braies-italy")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                Text("braies-italy")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .shadow(color: Color.black, radius: 2, x: 1, y: 1)
            }
          
            ZStack{
                Image("mount-currie-canada")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                Text("mount-currie-canada")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .shadow(color: Color.black, radius: 2, x: 1, y: 1)
            }
             
        }
        .tabViewStyle(.page(indexDisplayMode: PageTabViewStyle.IndexDisplayMode.always))
        .edgesIgnoringSafeArea(.top)
    }
}
