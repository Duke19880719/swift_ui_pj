//
//  SwiftUIView_14.5.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/27.
//

import SwiftUI

struct SwiftUIView_14_5: View {
    var body: some View {

        gesture_content_view{
            VStack{
                Text("Gesture Scale Example")
                    .font(.system(size: 25))
                    .foregroundColor(Color(UIColor.systemPink))
                    .shadow(color: Color.purple, radius: 2, x: 2, y: 3)
                
                Image(systemName: "music.note.list")
                    .font(.system(size: 60))
                    .foregroundColor(Color(UIColor.systemPink))
                    .shadow(color: Color.purple, radius: 2, x: 4, y: 3)
           }
       }
   
    }
}
struct gesture_content_view<content>:View where content:View{
    
    @State var scale:CGFloat = 1.0
    
    var content1:() -> content
    
    var body: some View {
        content1()
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture ()
                    .onChanged({ value in
                        
                        scale = value.magnitude
        }))
    }
    
    
}
struct SwiftUIView_14_5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_14_5()
    }
}
