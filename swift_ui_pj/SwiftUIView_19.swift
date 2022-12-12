//
//  SwiftUIView_19.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/6/1.
//

import SwiftUI

struct SwiftUIView_19: View {
  
// var bar_data_1:[Double]{
//        (1...10).map { _ in
//           return Double.random(in: 1...100)
//        }
//    }

    
    var bar_data_1:[Double] = [50.25,3.26,78.36,9.56,31.2]
    
    @State var bar_hover_check:Bool = false
    @State var bar_click:Int = 0
    @State var spacing:CGFloat = 0

    
     var body: some View {
         
         VStack(alignment: .leading){
          
             Text("Math Score").bold().foregroundColor(SwiftUI.Color.blue).padding()
             
             GeometryReader{ geo_value in
                 
                 HStack(alignment: .bottom, spacing: 2.5){
                     ForEach(bar_data_1.indices,id: \.self) { index in

                             Rectangle()
                                 .fill( LinearGradient(colors: [.blue,.purple], startPoint: UnitPoint.top, endPoint: UnitPoint.bottom))
                                 .frame(width:CGFloat(  geo_value.size.width/CGFloat(bar_data_1.count))-5, height:
                                        CGFloat(bar_data_1[index]/(bar_data_1.max()!)*(geo_value.size.height-10) )  )
                                 .onTapGesture {

                                     bar_hover_check = true
                                     bar_click = index
                                     spacing = geo_value.size.width/CGFloat(bar_data_1.count)
                                 }

                     }
                   
                 }
             }.frame( height: 120).padding(.horizontal,15)
             HStack{
                 if bar_hover_check{
                     Text("\(bar_data_1[bar_click], specifier: "%.2f")")
                         .bold()
                         .foregroundColor(SwiftUI.Color.blue)
                         .shadow(color: SwiftUI.Color.black, radius: 0.25, x: 1, y: 1)
                         .offset(x: CGFloat(CGFloat(bar_click)*spacing+15)).padding(.top,10)
                        
                   
                 }
             }
         }
     }

     
}






struct SwiftUIView_19_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_19()
    }
}
