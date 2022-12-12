//
//  SwiftUIView_3_1.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/15.
//

import SwiftUI

struct SwiftUIView_3_1: View {
    @State private var hovered = false
    
    var body: some View {

        VStack{
            ZStack{
                ExtractedView(icon_name: "pencil.and.outline", bg_color: Color.black, title_name: "Team", price: "$ 300").offset(x: 0, y: 150).padding()
                ExtractedView(icon_name: "square.and.pencil", bg_color: Color.gray, title_name: "Pro", price: "$ 50").padding()
                ExtractedView(icon_name: "lasso.and.sparkles", bg_color: Color.purple, title_name: "Basic", price: "$ 20").offset(x: 0, y: -160).padding()
            }
      
        }
    }
}

struct SwiftUIView_3_1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_3_1()
    }
}

struct ExtractedView: View {
    var icon_name:String
    var bg_color:Color
    var title_name:String
    var price:String
    
    var body: some View {
        VStack{
            
            Image(systemName: icon_name)
                .foregroundColor(Color.white)
                .font(.system(size: 25))
            
            Text(title_name)
                .foregroundColor(Color.white)
                .font(.system(size: 30, weight: .bold, design: .rounded))
            
            Text(price)
                .foregroundColor(Color.white)
                .font(.system(size: 30, weight: .bold, design: .rounded))
            
            Text("per month")
                .foregroundColor(Color.white)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 180, alignment: .center)
            .background(bg_color)
            .cornerRadius(30).padding()
    }
}
