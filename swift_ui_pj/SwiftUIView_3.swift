//
//  SwiftUIView_3.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/13.
//

import SwiftUI

struct SwiftUIView_3: View {
    var body: some View {
       
        VStack{
            
            HeadView()
            
            HStack{
                Plan_View(title_string: "Basic", price: "$ 2", bg_color: Color.purple, text_color: Color.white,icon_name: nil)
                ZStack{
                    Plan_View(title_string: "Pro", price: "$ 6", bg_color: Color.red, text_color: Color.white,icon_name: nil)
                    
                    Text("Best for designer").padding(5).font(.system(size: 12, weight: .heavy, design: .rounded)).foregroundColor(Color.white).background(Color.yellow).offset(x: 0, y: 68)
                }
               
            }.padding(.horizontal)
            VStack{
         
          
                Plan_View(title_string: "Team", price: "$ 30", bg_color: Color(red: 100/255, green: 100/255, blue: 200/255), text_color: Color.white,icon_name:  "wand.and.rays")
                
                Text("Best for team").padding(5).font(.system(size: 20, weight: .heavy, design: .rounded)).foregroundColor(Color.white).background(Color.yellow).offset(x: 0, y: -23)
                
//                ZStack{
//                    Image(systemName: "wand.and.rays").offset(x:0, y: -180).font(.system(size: 20)).foregroundColor(Color.white)
//                }
                
            
            }.padding(.horizontal).padding(.vertical)
           
            Spacer()
        }
        
    }
    
}

struct SwiftUIView_3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_3()
    }
}

struct HeadView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text("Choose")
                    .font(.system( .largeTitle,design: .rounded))
                    .fontWeight(.black)
                
                Text("Your Plan")
                    .font(.system( .largeTitle,design: .rounded))
                    .fontWeight(.black)
                
            }
            
            Spacer()
        }.padding(.horizontal)
       
    }
}

struct  Plan_View: View {
    
    var title_string:String
    var price:String
    var bg_color:Color
    var text_color:Color
    var icon_name:String?
    
    var body: some View {
        VStack{

            if let icon_str = icon_name {
                Image(systemName: icon_str )
                    .offset(x:0, y: 0)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
            }
            
            Text(title_string)
                .font(.system( .title,design: .rounded))
                .foregroundColor(text_color)
            
            Text(price)
                .font(.system(size: 35, weight: .heavy, design: .rounded))
                .foregroundColor(text_color)
            
            Text("per month")
                .font(.headline)
                .foregroundColor(text_color)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            .padding(25)
            .background(bg_color)
            .cornerRadius(20)
    }
}
