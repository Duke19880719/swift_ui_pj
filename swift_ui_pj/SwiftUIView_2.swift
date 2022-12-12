//
//  SwiftUIView＿second.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/1/29.
//

import SwiftUI

struct SwiftUIView_second: View {
    var body: some View {
        VStack{

            Image("123")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fill)
                .opacity(0.8)
                .frame(width: 600, height: 700, alignment: Alignment.center)
                .clipShape(Ellipse())
                .overlay(
                    Color.black.opacity(0.4).clipShape(Ellipse())
                        .overlay(
                            Text("殭屍校園")
                                .font(.largeTitle)
                                .frame(width: 600, height: 700, alignment: Alignment.center)
                                .foregroundColor(Color.white)
                            
                        
                        )
                
                )
            
           
        }
        
    }
}

struct SwiftUIView_second_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_second()
    }
}
