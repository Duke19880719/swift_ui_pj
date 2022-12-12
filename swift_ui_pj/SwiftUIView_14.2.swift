//
//  SwiftUIView_14.2.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/23.
//

import SwiftUI

struct SwiftUIView_14_2: View {
    @GestureState var check_drag = CGSize.zero
    var body: some View {
        Image(systemName: "star.circle.fill")
              .font(.system(size: 160))
              .offset(x: check_drag.width, y: check_drag.height)
              .animation(SwiftUI.Animation.easeInOut(duration: 1.5),value: check_drag)
              .foregroundColor( SwiftUI.Color.orange)
              .gesture(
                  
                DragGesture().updating($check_drag, body: { (currenState, state, transaction) in
                    state = currenState.translation
                })
              )
    }
}

struct SwiftUIView_14_2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_14_2()
    }
}
