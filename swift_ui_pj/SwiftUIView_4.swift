//
//  SwiftUIView_4.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/15.
//

import SwiftUI

struct SwiftUIView_4: View {
    var body: some View {
        
        ScrollView{
            HStack{
                VStack(alignment: .leading , spacing: 2){
                    Text(Date(), style: .date)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .shadow(color: Color.black , radius: 0.2, x: 1, y: 1)
                    
                    Text("Your Reading")
                        .font(.title)
                }
             Spacer()
            }.padding([.top,.leading])
            
            VStack{
               
                SwiftUIView_4_cardview(image_name: "4", category:  "SwiftUI", heading: "Object Dessign Code", author: "A-Wei")
                SwiftUIView_4_cardview(image_name: "5", category:  "SwiftUI", heading: "Object Dessign Code", author: "A-Wei")
                SwiftUIView_4_cardview(image_name: "6", category:  "SwiftUI", heading: "Object Dessign Code", author: "A-Wei")
                SwiftUIView_4_cardview(image_name: "7", category:  "SwiftUI", heading: "Object Dessign Code", author: "A-Wei")
               
            }
        }
        
       
        
    }
}

struct SwiftUIView_4_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_4()
    }
}
