//
//  SwiftUIView_4.1.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/16.
//

import SwiftUI

struct SwiftUIView_4_1: View {
    
    let cardviews = [
                          SwiftUIView_4_cardview(image_name: "4", category:  "SwiftUI", heading: "Object Dessign Code 1", author: "A-Wei"),
                          SwiftUIView_4_cardview(image_name: "5", category:  "SwiftUI", heading: "Object Dessign Code 2", author: "A-Wei"),
                          SwiftUIView_4_cardview(image_name: "6", category:  "SwiftUI", heading: "Object Dessign Code 3", author: "A-Wei"),
                          SwiftUIView_4_cardview(image_name: "7", category:  "SwiftUI", heading: "Object Dessign Code 4", author: "A-Wei")
                    ]
    
    @State var click_change_value:Bool = false
    @State var index_value: Int = 0
    
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                VStack(alignment: .leading , spacing: 2){
                    Text(Date(), style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .shadow(color: Color.black , radius: 0.2, x: 1, y: 1)
                    
                    Text("Your Reading").font(.title)
                }
             Spacer()
            }.padding([.top,.horizontal])
            
            HStack{

                if click_change_value{
                    cardviews[index_value]
                        .frame(width: 300)
                        .transition(.Transition1)
                }
                if !click_change_value{
                    cardviews[index_value]
                        .frame(width: 300)
                        .transition(.Transition2)
                }
            }.offset(x: 0, y: -10)
                .onTapGesture {
                    index_value = (index_value+1) % cardviews.count
                    
                    withAnimation(.easeInOut){
                        click_change_value.toggle()
                    }
                }
            
            
        }.offset(x: 0, y: -25)
        
    }
}

extension AnyTransition{
    static var Transition1:AnyTransition{
        AnyTransition.scale(scale: 1.5, anchor: .bottom).combined(with: .opacity)
    }
    
    static var Transition2:AnyTransition{
        AnyTransition.offset(x: -100, y: -50).combined(with: .scale)
    }
}


struct SwiftUIView_4_1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_4_1()
    }
}
