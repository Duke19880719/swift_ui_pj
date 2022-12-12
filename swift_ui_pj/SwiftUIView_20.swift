//
//  SwiftUIView_20.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/6/7.
//

import SwiftUI

struct SwiftUIView_20: View {

    var stock_obj = random_stock()
    var body: some View {
        VStack{
            VStack {
                       Text("Stocks")
                           .font(.largeTitle)
                        Line_Graph_View(
                            y_label_array:stock_obj.get_y_label() , price_array: stock_obj.get_stock_value()
                        )
                   }
                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                   .background(LinearGradient(colors: [Color(red: 150/255, green: 100/255, blue: 100/255, opacity: 1)], startPoint: .top, endPoint: .bottom))
                   .foregroundColor(.white)
                   .border(Color.white, width: 6)
                   .scaleEffect(0.85)
        }.background(LinearGradient(colors: [Color(red: 150/255, green: 100/255, blue: 100/255, opacity: 1)], startPoint: .top, endPoint: .bottom))
      
        
      
    }
}


struct stock{
    var price:Double
}

class random_stock{
    
    var stock_price_array:[stock] = []
    
    init(){
        for _ in 0...15{
            stock_price_array.append( stock(price: Double.random(in: 0...300)))
        }
    }
    
    func get_stock_value() -> [stock] {
        
        return stock_price_array
    }
    func get_y_label() -> [String]{
        
        return (2005...2010).map{ String($0) }
    }
       
}
struct Line_Graph_View: View{
    
    var y_label_array:[String]
    
    var  price_array:[stock]
    
    var screen_width = UIScreen.main.bounds.width
    
    var  path:Path{
        
        if price_array.isEmpty{
            return Path()
        }
        var offset_x:Int = Int(screen_width/CGFloat(y_label_array.count))
        
        var path_draw = Path()
        path_draw.move(to: CGPoint(x: 0, y: price_array[0].price))
        
        for index in 1...y_label_array.count{
            
            path_draw.addLine(to: CGPoint(x: offset_x*index, y: Int(price_array[index].price)   ))
           
        }
        
        return path_draw
        
    }
    
    
    var body : some View{
        VStack{
            
            path.stroke(Color.white, lineWidth: 2.0)
                .rotationEffect(.degrees(180), anchor: .center)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                .frame(maxWidth: .infinity, maxHeight: 300)
            
            //使用rotationEffect的.degrees(180)，是因為圖表是由下而上，而我們座標x y 軸是由上而下，所以需要做一次上下翻轉
            
            HStack{
                ForEach(y_label_array,id: \.self){ y_lable in
                    Text(y_lable)
                        .frame(width: screen_width/CGFloat(y_label_array.count)-10)
                }
            }
        }
        
        
    }
}


struct SwiftUIView_20_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_20()
    }
}
