//
//  SwiftUIView_14.swift
//  swift_ui_pj
//
//  Created by 江培瑋 on 2022/3/22.
//手勢應用

import SwiftUI

struct SwiftUIView_14: View {
    
    @State var check_click:Bool = false
    @GestureState var long_click:Bool = false
    
    var body: some View {
      Image(systemName: "star.circle.fill")
            .font(.system(size: 160))
            .scaleEffect(check_click ? 0.8 : 1.5)
            .animation(SwiftUI.Animation.easeInOut(duration: 1.5),value:  check_click)
            .foregroundColor(long_click ? Color.purple : SwiftUI.Color.orange)
            .gesture(
                
                LongPressGesture(minimumDuration: 1).updating($long_click, body: { (currenState, state, transaction) in
                    state = currenState
                }).onEnded({ _ in
                    check_click.toggle()
                })
            
            )
    }
}

struct SwiftUIView_14_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView_14()
    }
}
