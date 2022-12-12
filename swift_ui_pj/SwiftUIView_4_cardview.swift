//
//  SwiftUIView_4_cardview.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/2/15.
//

import SwiftUI

struct SwiftUIView_4_cardview: View {
    var image_name:String
    var category:String
    var heading:String
    var author:String
    
    var body: some View {
        VStack{
            Image(image_name).resizable().aspectRatio(contentMode: .fit).cornerRadius(10)
            
                HStack{
                    VStack(alignment: .leading){
                        Text(category).font(.headline).foregroundColor(.secondary)

                        Text(heading).font(.title).foregroundColor(.primary)

                        Text("Written by \(author)").font(.caption).foregroundColor(.secondary)
                    }
                    Spacer()
                }.padding()
            
        }.cornerRadius(10).overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.8),lineWidth: 1  )
          )
            .padding([.top,.horizontal])
            .cornerRadius(10)
            
    }
}

struct SwiftUIView_4_cardview_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_4_cardview(image_name: "5", category:  "SwiftUI", heading: "Object Dessign Code", author: "A-Wei")
    }
}
