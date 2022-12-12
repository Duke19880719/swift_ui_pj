//
//  SwiftUIView_14.3.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/23.
//

import SwiftUI

struct SwiftUIView_14_3: View {
 
    var body: some View {
        drag_view(){
            Text("Drag Text").bold()
        }
      

    }
}
struct drag_view<Content>: View where Content:View {
    
    var content: () -> Content
    
    @GestureState var check_drag = CGSize.zero
    @State var pos = CGSize.zero
    
    var body: some View {
        content()
            .font(.system(size: 50))
            .shadow(color: Color.blue, radius: 1.5, x: 2, y: 2)
            .offset(x:pos.width + check_drag.width, y:pos.height + check_drag.height)
            .animation(SwiftUI.Animation.easeInOut(duration: 1),value: check_drag)
            .foregroundColor( SwiftUI.Color.orange)
            .gesture(
                
              DragGesture().updating($check_drag, body: { (currenState, state, transaction) in
                  state = currenState.translation
              }).onEnded({ value in
                  pos.width += value.translation.width
                  pos.height += value.translation.height
              })
            )
    }
}
struct SwiftUIView_14_3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_14_3()
    }
}
