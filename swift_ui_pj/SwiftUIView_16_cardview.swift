//
//  SwiftUIView_16_cardview.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/4/11.
//

import SwiftUI

struct SwiftUIView_16_cardview: View,Identifiable {
    
    var id = UUID()
    var image:String?
    var title:String?
    
    var body: some View {
        GeometryReader{ view_value in
            
            ZStack{
                Image(image!)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity )
                    .cornerRadius(10)
                    .padding(.horizontal,20)
                    
                Text(title!)
                    .font(.system(.title2,design: .rounded))
                    .fontWeight(.bold)
                    .padding(.horizontal,15)
                    .padding(.vertical, 10)
                    .background(Color(UIColor.systemBlue).opacity(0.6))
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .scaledToFill()
                    .offset(x: 0, y: (view_value.size.height)/3)
                        
            
            }.padding(.bottom)
        }

           
    }
}

struct SwiftUIView_16_cardview_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            SwiftUIView_16_cardview( image: "yosemite-usa", title: "Yosemite, USA")
            top_view().previewLayout(.sizeThatFits)
            bottom_view().previewLayout(.sizeThatFits)
        }
        
    }
}

struct top_view:View{
    
    var body: some View{
        
        HStack{
            
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 30))
            Spacer()
            Image(systemName: "mappin.and.ellipse")
                .font(.system(size: 35))
            Spacer()
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 30))
        }
        .padding(.horizontal)
    }
}

struct bottom_view:View{
    
    var body: some View{
        
        HStack{
            
            Image(systemName: "xmark")
                .font(.system(size: 30))
                .foregroundColor(.black)
            Spacer()
            
            Button {
                
            } label: {
                Text("Book It Now!")
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.horizontal,35)
                    .padding(.vertical,15)
                    .background(.black)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
            Image(systemName: "heart")
                .font(.system(size: 30))
                .foregroundColor(.black)
        }.padding(.horizontal)
      
   
    }
}
